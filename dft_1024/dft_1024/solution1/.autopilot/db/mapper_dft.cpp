#include <systemc>
#include <list>
#include <map>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;

namespace bcsim
{
  struct Buffer {
    char *first;
    Buffer(char *addr) : first(addr)
    {
    }
  };

  struct DBuffer : public Buffer {
    size_t ufree;

    DBuffer(size_t usize) : Buffer(nullptr), ufree(1<<10)
    {
      first = new char[usize*ufree];
    }

    ~DBuffer()
    {
      delete[] first;
    }
  };

  struct CStream {
    char *front;
    char *back;
    size_t num;
    size_t usize;
    std::list<Buffer*> bufs;
    bool dynamic;

    CStream() : front(nullptr), back(nullptr),
                num(0), usize(0), dynamic(true)
    {
    }

    ~CStream()
    {
      for (Buffer *p : bufs) {
        delete p;
      }
    }

    template<typename T>
    T* data()
    {
      return (T*)front;
    }

    template<typename T>
    void transfer(hls::stream<T> *param)
    {
      while (!empty()) {
        param->write(*(T*)nextRead());
      }
    }

    bool empty();
    char* nextRead();
    char* nextWrite();
  };

  bool CStream::empty()
  {
    return num == 0;
  }

  char* CStream::nextRead()
  {
    assert(num > 0);
    char *res = front;
    front += usize;
    --num;
    return res;
  }

  char* CStream::nextWrite()
  {
    if (dynamic) {
      if (static_cast<DBuffer*>(bufs.back())->ufree == 0) {
        bufs.push_back(new DBuffer(usize));
        back = bufs.back()->first;
      }
      --static_cast<DBuffer*>(bufs.back())->ufree;
    }
    char *res = back;
    back += usize;
    ++num;
    return res;
  }

  std::list<CStream> streams;
  std::map<char*, CStream*> prebuilt;

  CStream* createStream(size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = true;
      s.bufs.push_back(new DBuffer(usize));
      s.front = s.bufs.back()->first;
      s.back = s.front;
      s.num = 0;
      s.usize = usize;
    }
    return &s;
  }

  template<typename T>
  CStream* createStream(hls::stream<T> *param)
  {
    CStream *s = createStream(sizeof(T));
    {
      s->dynamic = true;
      while (!param->empty()) {
        T data = param->read();
        memcpy(s->nextWrite(), (char*)&data, sizeof(T));
      }
      prebuilt[s->front] = s;
    }
    return s;
  }

  template<typename T>
  CStream* createStream(T *param, size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = false;
      s.bufs.push_back(new Buffer((char*)param));
      s.front = s.back = s.bufs.back()->first;
      s.usize = usize;
      s.num = ~0UL;
    }
    prebuilt[s.front] = &s;
    return &s;
  }

  CStream* findStream(char *buf)
  {
    return prebuilt.at(buf);
  }
}
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
extern "C" void dft(int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*);
extern "C" void apatb_dft_hw(volatile void * __xlx_apatb_param_real_sample_0, volatile void * __xlx_apatb_param_real_sample_1, volatile void * __xlx_apatb_param_real_sample_2, volatile void * __xlx_apatb_param_real_sample_3, volatile void * __xlx_apatb_param_real_sample_4, volatile void * __xlx_apatb_param_real_sample_5, volatile void * __xlx_apatb_param_real_sample_6, volatile void * __xlx_apatb_param_real_sample_7, volatile void * __xlx_apatb_param_real_sample_8, volatile void * __xlx_apatb_param_real_sample_9, volatile void * __xlx_apatb_param_real_sample_10, volatile void * __xlx_apatb_param_real_sample_11, volatile void * __xlx_apatb_param_real_sample_12, volatile void * __xlx_apatb_param_real_sample_13, volatile void * __xlx_apatb_param_real_sample_14, volatile void * __xlx_apatb_param_real_sample_15, volatile void * __xlx_apatb_param_real_sample_16, volatile void * __xlx_apatb_param_real_sample_17, volatile void * __xlx_apatb_param_real_sample_18, volatile void * __xlx_apatb_param_real_sample_19, volatile void * __xlx_apatb_param_real_sample_20, volatile void * __xlx_apatb_param_real_sample_21, volatile void * __xlx_apatb_param_real_sample_22, volatile void * __xlx_apatb_param_real_sample_23, volatile void * __xlx_apatb_param_real_sample_24, volatile void * __xlx_apatb_param_real_sample_25, volatile void * __xlx_apatb_param_real_sample_26, volatile void * __xlx_apatb_param_real_sample_27, volatile void * __xlx_apatb_param_real_sample_28, volatile void * __xlx_apatb_param_real_sample_29, volatile void * __xlx_apatb_param_real_sample_30, volatile void * __xlx_apatb_param_real_sample_31, volatile void * __xlx_apatb_param_real_sample_32, volatile void * __xlx_apatb_param_real_sample_33, volatile void * __xlx_apatb_param_real_sample_34, volatile void * __xlx_apatb_param_real_sample_35, volatile void * __xlx_apatb_param_real_sample_36, volatile void * __xlx_apatb_param_real_sample_37, volatile void * __xlx_apatb_param_real_sample_38, volatile void * __xlx_apatb_param_real_sample_39, volatile void * __xlx_apatb_param_real_sample_40, volatile void * __xlx_apatb_param_real_sample_41, volatile void * __xlx_apatb_param_real_sample_42, volatile void * __xlx_apatb_param_real_sample_43, volatile void * __xlx_apatb_param_real_sample_44, volatile void * __xlx_apatb_param_real_sample_45, volatile void * __xlx_apatb_param_real_sample_46, volatile void * __xlx_apatb_param_real_sample_47, volatile void * __xlx_apatb_param_real_sample_48, volatile void * __xlx_apatb_param_real_sample_49, volatile void * __xlx_apatb_param_real_sample_50, volatile void * __xlx_apatb_param_real_sample_51, volatile void * __xlx_apatb_param_real_sample_52, volatile void * __xlx_apatb_param_real_sample_53, volatile void * __xlx_apatb_param_real_sample_54, volatile void * __xlx_apatb_param_real_sample_55, volatile void * __xlx_apatb_param_real_sample_56, volatile void * __xlx_apatb_param_real_sample_57, volatile void * __xlx_apatb_param_real_sample_58, volatile void * __xlx_apatb_param_real_sample_59, volatile void * __xlx_apatb_param_real_sample_60, volatile void * __xlx_apatb_param_real_sample_61, volatile void * __xlx_apatb_param_real_sample_62, volatile void * __xlx_apatb_param_real_sample_63, volatile void * __xlx_apatb_param_imag_sample_0, volatile void * __xlx_apatb_param_imag_sample_1, volatile void * __xlx_apatb_param_imag_sample_2, volatile void * __xlx_apatb_param_imag_sample_3, volatile void * __xlx_apatb_param_imag_sample_4, volatile void * __xlx_apatb_param_imag_sample_5, volatile void * __xlx_apatb_param_imag_sample_6, volatile void * __xlx_apatb_param_imag_sample_7, volatile void * __xlx_apatb_param_imag_sample_8, volatile void * __xlx_apatb_param_imag_sample_9, volatile void * __xlx_apatb_param_imag_sample_10, volatile void * __xlx_apatb_param_imag_sample_11, volatile void * __xlx_apatb_param_imag_sample_12, volatile void * __xlx_apatb_param_imag_sample_13, volatile void * __xlx_apatb_param_imag_sample_14, volatile void * __xlx_apatb_param_imag_sample_15, volatile void * __xlx_apatb_param_imag_sample_16, volatile void * __xlx_apatb_param_imag_sample_17, volatile void * __xlx_apatb_param_imag_sample_18, volatile void * __xlx_apatb_param_imag_sample_19, volatile void * __xlx_apatb_param_imag_sample_20, volatile void * __xlx_apatb_param_imag_sample_21, volatile void * __xlx_apatb_param_imag_sample_22, volatile void * __xlx_apatb_param_imag_sample_23, volatile void * __xlx_apatb_param_imag_sample_24, volatile void * __xlx_apatb_param_imag_sample_25, volatile void * __xlx_apatb_param_imag_sample_26, volatile void * __xlx_apatb_param_imag_sample_27, volatile void * __xlx_apatb_param_imag_sample_28, volatile void * __xlx_apatb_param_imag_sample_29, volatile void * __xlx_apatb_param_imag_sample_30, volatile void * __xlx_apatb_param_imag_sample_31, volatile void * __xlx_apatb_param_imag_sample_32, volatile void * __xlx_apatb_param_imag_sample_33, volatile void * __xlx_apatb_param_imag_sample_34, volatile void * __xlx_apatb_param_imag_sample_35, volatile void * __xlx_apatb_param_imag_sample_36, volatile void * __xlx_apatb_param_imag_sample_37, volatile void * __xlx_apatb_param_imag_sample_38, volatile void * __xlx_apatb_param_imag_sample_39, volatile void * __xlx_apatb_param_imag_sample_40, volatile void * __xlx_apatb_param_imag_sample_41, volatile void * __xlx_apatb_param_imag_sample_42, volatile void * __xlx_apatb_param_imag_sample_43, volatile void * __xlx_apatb_param_imag_sample_44, volatile void * __xlx_apatb_param_imag_sample_45, volatile void * __xlx_apatb_param_imag_sample_46, volatile void * __xlx_apatb_param_imag_sample_47, volatile void * __xlx_apatb_param_imag_sample_48, volatile void * __xlx_apatb_param_imag_sample_49, volatile void * __xlx_apatb_param_imag_sample_50, volatile void * __xlx_apatb_param_imag_sample_51, volatile void * __xlx_apatb_param_imag_sample_52, volatile void * __xlx_apatb_param_imag_sample_53, volatile void * __xlx_apatb_param_imag_sample_54, volatile void * __xlx_apatb_param_imag_sample_55, volatile void * __xlx_apatb_param_imag_sample_56, volatile void * __xlx_apatb_param_imag_sample_57, volatile void * __xlx_apatb_param_imag_sample_58, volatile void * __xlx_apatb_param_imag_sample_59, volatile void * __xlx_apatb_param_imag_sample_60, volatile void * __xlx_apatb_param_imag_sample_61, volatile void * __xlx_apatb_param_imag_sample_62, volatile void * __xlx_apatb_param_imag_sample_63, volatile void * __xlx_apatb_param_real_output_0, volatile void * __xlx_apatb_param_real_output_1, volatile void * __xlx_apatb_param_real_output_2, volatile void * __xlx_apatb_param_real_output_3, volatile void * __xlx_apatb_param_real_output_4, volatile void * __xlx_apatb_param_real_output_5, volatile void * __xlx_apatb_param_real_output_6, volatile void * __xlx_apatb_param_real_output_7, volatile void * __xlx_apatb_param_real_output_8, volatile void * __xlx_apatb_param_real_output_9, volatile void * __xlx_apatb_param_real_output_10, volatile void * __xlx_apatb_param_real_output_11, volatile void * __xlx_apatb_param_real_output_12, volatile void * __xlx_apatb_param_real_output_13, volatile void * __xlx_apatb_param_real_output_14, volatile void * __xlx_apatb_param_real_output_15, volatile void * __xlx_apatb_param_real_output_16, volatile void * __xlx_apatb_param_real_output_17, volatile void * __xlx_apatb_param_real_output_18, volatile void * __xlx_apatb_param_real_output_19, volatile void * __xlx_apatb_param_real_output_20, volatile void * __xlx_apatb_param_real_output_21, volatile void * __xlx_apatb_param_real_output_22, volatile void * __xlx_apatb_param_real_output_23, volatile void * __xlx_apatb_param_real_output_24, volatile void * __xlx_apatb_param_real_output_25, volatile void * __xlx_apatb_param_real_output_26, volatile void * __xlx_apatb_param_real_output_27, volatile void * __xlx_apatb_param_real_output_28, volatile void * __xlx_apatb_param_real_output_29, volatile void * __xlx_apatb_param_real_output_30, volatile void * __xlx_apatb_param_real_output_31, volatile void * __xlx_apatb_param_real_output_32, volatile void * __xlx_apatb_param_real_output_33, volatile void * __xlx_apatb_param_real_output_34, volatile void * __xlx_apatb_param_real_output_35, volatile void * __xlx_apatb_param_real_output_36, volatile void * __xlx_apatb_param_real_output_37, volatile void * __xlx_apatb_param_real_output_38, volatile void * __xlx_apatb_param_real_output_39, volatile void * __xlx_apatb_param_real_output_40, volatile void * __xlx_apatb_param_real_output_41, volatile void * __xlx_apatb_param_real_output_42, volatile void * __xlx_apatb_param_real_output_43, volatile void * __xlx_apatb_param_real_output_44, volatile void * __xlx_apatb_param_real_output_45, volatile void * __xlx_apatb_param_real_output_46, volatile void * __xlx_apatb_param_real_output_47, volatile void * __xlx_apatb_param_real_output_48, volatile void * __xlx_apatb_param_real_output_49, volatile void * __xlx_apatb_param_real_output_50, volatile void * __xlx_apatb_param_real_output_51, volatile void * __xlx_apatb_param_real_output_52, volatile void * __xlx_apatb_param_real_output_53, volatile void * __xlx_apatb_param_real_output_54, volatile void * __xlx_apatb_param_real_output_55, volatile void * __xlx_apatb_param_real_output_56, volatile void * __xlx_apatb_param_real_output_57, volatile void * __xlx_apatb_param_real_output_58, volatile void * __xlx_apatb_param_real_output_59, volatile void * __xlx_apatb_param_real_output_60, volatile void * __xlx_apatb_param_real_output_61, volatile void * __xlx_apatb_param_real_output_62, volatile void * __xlx_apatb_param_real_output_63, volatile void * __xlx_apatb_param_imag_output_0, volatile void * __xlx_apatb_param_imag_output_1, volatile void * __xlx_apatb_param_imag_output_2, volatile void * __xlx_apatb_param_imag_output_3, volatile void * __xlx_apatb_param_imag_output_4, volatile void * __xlx_apatb_param_imag_output_5, volatile void * __xlx_apatb_param_imag_output_6, volatile void * __xlx_apatb_param_imag_output_7, volatile void * __xlx_apatb_param_imag_output_8, volatile void * __xlx_apatb_param_imag_output_9, volatile void * __xlx_apatb_param_imag_output_10, volatile void * __xlx_apatb_param_imag_output_11, volatile void * __xlx_apatb_param_imag_output_12, volatile void * __xlx_apatb_param_imag_output_13, volatile void * __xlx_apatb_param_imag_output_14, volatile void * __xlx_apatb_param_imag_output_15, volatile void * __xlx_apatb_param_imag_output_16, volatile void * __xlx_apatb_param_imag_output_17, volatile void * __xlx_apatb_param_imag_output_18, volatile void * __xlx_apatb_param_imag_output_19, volatile void * __xlx_apatb_param_imag_output_20, volatile void * __xlx_apatb_param_imag_output_21, volatile void * __xlx_apatb_param_imag_output_22, volatile void * __xlx_apatb_param_imag_output_23, volatile void * __xlx_apatb_param_imag_output_24, volatile void * __xlx_apatb_param_imag_output_25, volatile void * __xlx_apatb_param_imag_output_26, volatile void * __xlx_apatb_param_imag_output_27, volatile void * __xlx_apatb_param_imag_output_28, volatile void * __xlx_apatb_param_imag_output_29, volatile void * __xlx_apatb_param_imag_output_30, volatile void * __xlx_apatb_param_imag_output_31, volatile void * __xlx_apatb_param_imag_output_32, volatile void * __xlx_apatb_param_imag_output_33, volatile void * __xlx_apatb_param_imag_output_34, volatile void * __xlx_apatb_param_imag_output_35, volatile void * __xlx_apatb_param_imag_output_36, volatile void * __xlx_apatb_param_imag_output_37, volatile void * __xlx_apatb_param_imag_output_38, volatile void * __xlx_apatb_param_imag_output_39, volatile void * __xlx_apatb_param_imag_output_40, volatile void * __xlx_apatb_param_imag_output_41, volatile void * __xlx_apatb_param_imag_output_42, volatile void * __xlx_apatb_param_imag_output_43, volatile void * __xlx_apatb_param_imag_output_44, volatile void * __xlx_apatb_param_imag_output_45, volatile void * __xlx_apatb_param_imag_output_46, volatile void * __xlx_apatb_param_imag_output_47, volatile void * __xlx_apatb_param_imag_output_48, volatile void * __xlx_apatb_param_imag_output_49, volatile void * __xlx_apatb_param_imag_output_50, volatile void * __xlx_apatb_param_imag_output_51, volatile void * __xlx_apatb_param_imag_output_52, volatile void * __xlx_apatb_param_imag_output_53, volatile void * __xlx_apatb_param_imag_output_54, volatile void * __xlx_apatb_param_imag_output_55, volatile void * __xlx_apatb_param_imag_output_56, volatile void * __xlx_apatb_param_imag_output_57, volatile void * __xlx_apatb_param_imag_output_58, volatile void * __xlx_apatb_param_imag_output_59, volatile void * __xlx_apatb_param_imag_output_60, volatile void * __xlx_apatb_param_imag_output_61, volatile void * __xlx_apatb_param_imag_output_62, volatile void * __xlx_apatb_param_imag_output_63) {
  // Collect __xlx_real_sample_0__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_0__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_0)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_0)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_0)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_0)[j*4+3];
    __xlx_real_sample_0__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_0 = 16;
  int __xlx_offset_param_real_sample_0 = 0;
  int __xlx_offset_byte_param_real_sample_0 = 0*4;
  int* __xlx_real_sample_0__input_buffer= new int[__xlx_real_sample_0__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_0__tmp_vec.size(); ++i) {
    __xlx_real_sample_0__input_buffer[i] = __xlx_real_sample_0__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_1__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_1__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_1)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_1)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_1)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_1)[j*4+3];
    __xlx_real_sample_1__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_1 = 16;
  int __xlx_offset_param_real_sample_1 = 0;
  int __xlx_offset_byte_param_real_sample_1 = 0*4;
  int* __xlx_real_sample_1__input_buffer= new int[__xlx_real_sample_1__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_1__tmp_vec.size(); ++i) {
    __xlx_real_sample_1__input_buffer[i] = __xlx_real_sample_1__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_2__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_2__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_2)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_2)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_2)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_2)[j*4+3];
    __xlx_real_sample_2__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_2 = 16;
  int __xlx_offset_param_real_sample_2 = 0;
  int __xlx_offset_byte_param_real_sample_2 = 0*4;
  int* __xlx_real_sample_2__input_buffer= new int[__xlx_real_sample_2__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_2__tmp_vec.size(); ++i) {
    __xlx_real_sample_2__input_buffer[i] = __xlx_real_sample_2__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_3__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_3__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_3)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_3)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_3)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_3)[j*4+3];
    __xlx_real_sample_3__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_3 = 16;
  int __xlx_offset_param_real_sample_3 = 0;
  int __xlx_offset_byte_param_real_sample_3 = 0*4;
  int* __xlx_real_sample_3__input_buffer= new int[__xlx_real_sample_3__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_3__tmp_vec.size(); ++i) {
    __xlx_real_sample_3__input_buffer[i] = __xlx_real_sample_3__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_4__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_4__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_4)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_4)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_4)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_4)[j*4+3];
    __xlx_real_sample_4__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_4 = 16;
  int __xlx_offset_param_real_sample_4 = 0;
  int __xlx_offset_byte_param_real_sample_4 = 0*4;
  int* __xlx_real_sample_4__input_buffer= new int[__xlx_real_sample_4__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_4__tmp_vec.size(); ++i) {
    __xlx_real_sample_4__input_buffer[i] = __xlx_real_sample_4__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_5__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_5__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_5)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_5)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_5)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_5)[j*4+3];
    __xlx_real_sample_5__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_5 = 16;
  int __xlx_offset_param_real_sample_5 = 0;
  int __xlx_offset_byte_param_real_sample_5 = 0*4;
  int* __xlx_real_sample_5__input_buffer= new int[__xlx_real_sample_5__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_5__tmp_vec.size(); ++i) {
    __xlx_real_sample_5__input_buffer[i] = __xlx_real_sample_5__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_6__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_6__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_6)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_6)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_6)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_6)[j*4+3];
    __xlx_real_sample_6__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_6 = 16;
  int __xlx_offset_param_real_sample_6 = 0;
  int __xlx_offset_byte_param_real_sample_6 = 0*4;
  int* __xlx_real_sample_6__input_buffer= new int[__xlx_real_sample_6__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_6__tmp_vec.size(); ++i) {
    __xlx_real_sample_6__input_buffer[i] = __xlx_real_sample_6__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_7__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_7__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_7)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_7)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_7)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_7)[j*4+3];
    __xlx_real_sample_7__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_7 = 16;
  int __xlx_offset_param_real_sample_7 = 0;
  int __xlx_offset_byte_param_real_sample_7 = 0*4;
  int* __xlx_real_sample_7__input_buffer= new int[__xlx_real_sample_7__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_7__tmp_vec.size(); ++i) {
    __xlx_real_sample_7__input_buffer[i] = __xlx_real_sample_7__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_8__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_8__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_8)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_8)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_8)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_8)[j*4+3];
    __xlx_real_sample_8__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_8 = 16;
  int __xlx_offset_param_real_sample_8 = 0;
  int __xlx_offset_byte_param_real_sample_8 = 0*4;
  int* __xlx_real_sample_8__input_buffer= new int[__xlx_real_sample_8__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_8__tmp_vec.size(); ++i) {
    __xlx_real_sample_8__input_buffer[i] = __xlx_real_sample_8__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_9__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_9__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_9)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_9)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_9)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_9)[j*4+3];
    __xlx_real_sample_9__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_9 = 16;
  int __xlx_offset_param_real_sample_9 = 0;
  int __xlx_offset_byte_param_real_sample_9 = 0*4;
  int* __xlx_real_sample_9__input_buffer= new int[__xlx_real_sample_9__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_9__tmp_vec.size(); ++i) {
    __xlx_real_sample_9__input_buffer[i] = __xlx_real_sample_9__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_10__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_10__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_10)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_10)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_10)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_10)[j*4+3];
    __xlx_real_sample_10__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_10 = 16;
  int __xlx_offset_param_real_sample_10 = 0;
  int __xlx_offset_byte_param_real_sample_10 = 0*4;
  int* __xlx_real_sample_10__input_buffer= new int[__xlx_real_sample_10__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_10__tmp_vec.size(); ++i) {
    __xlx_real_sample_10__input_buffer[i] = __xlx_real_sample_10__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_11__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_11__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_11)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_11)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_11)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_11)[j*4+3];
    __xlx_real_sample_11__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_11 = 16;
  int __xlx_offset_param_real_sample_11 = 0;
  int __xlx_offset_byte_param_real_sample_11 = 0*4;
  int* __xlx_real_sample_11__input_buffer= new int[__xlx_real_sample_11__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_11__tmp_vec.size(); ++i) {
    __xlx_real_sample_11__input_buffer[i] = __xlx_real_sample_11__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_12__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_12__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_12)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_12)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_12)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_12)[j*4+3];
    __xlx_real_sample_12__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_12 = 16;
  int __xlx_offset_param_real_sample_12 = 0;
  int __xlx_offset_byte_param_real_sample_12 = 0*4;
  int* __xlx_real_sample_12__input_buffer= new int[__xlx_real_sample_12__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_12__tmp_vec.size(); ++i) {
    __xlx_real_sample_12__input_buffer[i] = __xlx_real_sample_12__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_13__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_13__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_13)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_13)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_13)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_13)[j*4+3];
    __xlx_real_sample_13__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_13 = 16;
  int __xlx_offset_param_real_sample_13 = 0;
  int __xlx_offset_byte_param_real_sample_13 = 0*4;
  int* __xlx_real_sample_13__input_buffer= new int[__xlx_real_sample_13__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_13__tmp_vec.size(); ++i) {
    __xlx_real_sample_13__input_buffer[i] = __xlx_real_sample_13__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_14__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_14__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_14)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_14)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_14)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_14)[j*4+3];
    __xlx_real_sample_14__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_14 = 16;
  int __xlx_offset_param_real_sample_14 = 0;
  int __xlx_offset_byte_param_real_sample_14 = 0*4;
  int* __xlx_real_sample_14__input_buffer= new int[__xlx_real_sample_14__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_14__tmp_vec.size(); ++i) {
    __xlx_real_sample_14__input_buffer[i] = __xlx_real_sample_14__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_15__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_15__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_15)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_15)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_15)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_15)[j*4+3];
    __xlx_real_sample_15__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_15 = 16;
  int __xlx_offset_param_real_sample_15 = 0;
  int __xlx_offset_byte_param_real_sample_15 = 0*4;
  int* __xlx_real_sample_15__input_buffer= new int[__xlx_real_sample_15__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_15__tmp_vec.size(); ++i) {
    __xlx_real_sample_15__input_buffer[i] = __xlx_real_sample_15__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_16__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_16__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_16)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_16)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_16)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_16)[j*4+3];
    __xlx_real_sample_16__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_16 = 16;
  int __xlx_offset_param_real_sample_16 = 0;
  int __xlx_offset_byte_param_real_sample_16 = 0*4;
  int* __xlx_real_sample_16__input_buffer= new int[__xlx_real_sample_16__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_16__tmp_vec.size(); ++i) {
    __xlx_real_sample_16__input_buffer[i] = __xlx_real_sample_16__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_17__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_17__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_17)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_17)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_17)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_17)[j*4+3];
    __xlx_real_sample_17__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_17 = 16;
  int __xlx_offset_param_real_sample_17 = 0;
  int __xlx_offset_byte_param_real_sample_17 = 0*4;
  int* __xlx_real_sample_17__input_buffer= new int[__xlx_real_sample_17__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_17__tmp_vec.size(); ++i) {
    __xlx_real_sample_17__input_buffer[i] = __xlx_real_sample_17__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_18__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_18__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_18)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_18)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_18)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_18)[j*4+3];
    __xlx_real_sample_18__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_18 = 16;
  int __xlx_offset_param_real_sample_18 = 0;
  int __xlx_offset_byte_param_real_sample_18 = 0*4;
  int* __xlx_real_sample_18__input_buffer= new int[__xlx_real_sample_18__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_18__tmp_vec.size(); ++i) {
    __xlx_real_sample_18__input_buffer[i] = __xlx_real_sample_18__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_19__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_19__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_19)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_19)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_19)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_19)[j*4+3];
    __xlx_real_sample_19__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_19 = 16;
  int __xlx_offset_param_real_sample_19 = 0;
  int __xlx_offset_byte_param_real_sample_19 = 0*4;
  int* __xlx_real_sample_19__input_buffer= new int[__xlx_real_sample_19__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_19__tmp_vec.size(); ++i) {
    __xlx_real_sample_19__input_buffer[i] = __xlx_real_sample_19__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_20__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_20__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_20)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_20)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_20)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_20)[j*4+3];
    __xlx_real_sample_20__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_20 = 16;
  int __xlx_offset_param_real_sample_20 = 0;
  int __xlx_offset_byte_param_real_sample_20 = 0*4;
  int* __xlx_real_sample_20__input_buffer= new int[__xlx_real_sample_20__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_20__tmp_vec.size(); ++i) {
    __xlx_real_sample_20__input_buffer[i] = __xlx_real_sample_20__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_21__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_21__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_21)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_21)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_21)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_21)[j*4+3];
    __xlx_real_sample_21__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_21 = 16;
  int __xlx_offset_param_real_sample_21 = 0;
  int __xlx_offset_byte_param_real_sample_21 = 0*4;
  int* __xlx_real_sample_21__input_buffer= new int[__xlx_real_sample_21__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_21__tmp_vec.size(); ++i) {
    __xlx_real_sample_21__input_buffer[i] = __xlx_real_sample_21__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_22__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_22__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_22)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_22)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_22)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_22)[j*4+3];
    __xlx_real_sample_22__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_22 = 16;
  int __xlx_offset_param_real_sample_22 = 0;
  int __xlx_offset_byte_param_real_sample_22 = 0*4;
  int* __xlx_real_sample_22__input_buffer= new int[__xlx_real_sample_22__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_22__tmp_vec.size(); ++i) {
    __xlx_real_sample_22__input_buffer[i] = __xlx_real_sample_22__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_23__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_23__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_23)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_23)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_23)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_23)[j*4+3];
    __xlx_real_sample_23__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_23 = 16;
  int __xlx_offset_param_real_sample_23 = 0;
  int __xlx_offset_byte_param_real_sample_23 = 0*4;
  int* __xlx_real_sample_23__input_buffer= new int[__xlx_real_sample_23__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_23__tmp_vec.size(); ++i) {
    __xlx_real_sample_23__input_buffer[i] = __xlx_real_sample_23__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_24__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_24__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_24)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_24)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_24)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_24)[j*4+3];
    __xlx_real_sample_24__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_24 = 16;
  int __xlx_offset_param_real_sample_24 = 0;
  int __xlx_offset_byte_param_real_sample_24 = 0*4;
  int* __xlx_real_sample_24__input_buffer= new int[__xlx_real_sample_24__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_24__tmp_vec.size(); ++i) {
    __xlx_real_sample_24__input_buffer[i] = __xlx_real_sample_24__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_25__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_25__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_25)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_25)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_25)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_25)[j*4+3];
    __xlx_real_sample_25__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_25 = 16;
  int __xlx_offset_param_real_sample_25 = 0;
  int __xlx_offset_byte_param_real_sample_25 = 0*4;
  int* __xlx_real_sample_25__input_buffer= new int[__xlx_real_sample_25__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_25__tmp_vec.size(); ++i) {
    __xlx_real_sample_25__input_buffer[i] = __xlx_real_sample_25__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_26__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_26__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_26)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_26)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_26)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_26)[j*4+3];
    __xlx_real_sample_26__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_26 = 16;
  int __xlx_offset_param_real_sample_26 = 0;
  int __xlx_offset_byte_param_real_sample_26 = 0*4;
  int* __xlx_real_sample_26__input_buffer= new int[__xlx_real_sample_26__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_26__tmp_vec.size(); ++i) {
    __xlx_real_sample_26__input_buffer[i] = __xlx_real_sample_26__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_27__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_27__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_27)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_27)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_27)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_27)[j*4+3];
    __xlx_real_sample_27__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_27 = 16;
  int __xlx_offset_param_real_sample_27 = 0;
  int __xlx_offset_byte_param_real_sample_27 = 0*4;
  int* __xlx_real_sample_27__input_buffer= new int[__xlx_real_sample_27__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_27__tmp_vec.size(); ++i) {
    __xlx_real_sample_27__input_buffer[i] = __xlx_real_sample_27__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_28__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_28__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_28)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_28)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_28)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_28)[j*4+3];
    __xlx_real_sample_28__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_28 = 16;
  int __xlx_offset_param_real_sample_28 = 0;
  int __xlx_offset_byte_param_real_sample_28 = 0*4;
  int* __xlx_real_sample_28__input_buffer= new int[__xlx_real_sample_28__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_28__tmp_vec.size(); ++i) {
    __xlx_real_sample_28__input_buffer[i] = __xlx_real_sample_28__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_29__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_29__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_29)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_29)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_29)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_29)[j*4+3];
    __xlx_real_sample_29__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_29 = 16;
  int __xlx_offset_param_real_sample_29 = 0;
  int __xlx_offset_byte_param_real_sample_29 = 0*4;
  int* __xlx_real_sample_29__input_buffer= new int[__xlx_real_sample_29__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_29__tmp_vec.size(); ++i) {
    __xlx_real_sample_29__input_buffer[i] = __xlx_real_sample_29__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_30__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_30__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_30)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_30)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_30)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_30)[j*4+3];
    __xlx_real_sample_30__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_30 = 16;
  int __xlx_offset_param_real_sample_30 = 0;
  int __xlx_offset_byte_param_real_sample_30 = 0*4;
  int* __xlx_real_sample_30__input_buffer= new int[__xlx_real_sample_30__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_30__tmp_vec.size(); ++i) {
    __xlx_real_sample_30__input_buffer[i] = __xlx_real_sample_30__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_31__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_31__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_31)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_31)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_31)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_31)[j*4+3];
    __xlx_real_sample_31__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_31 = 16;
  int __xlx_offset_param_real_sample_31 = 0;
  int __xlx_offset_byte_param_real_sample_31 = 0*4;
  int* __xlx_real_sample_31__input_buffer= new int[__xlx_real_sample_31__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_31__tmp_vec.size(); ++i) {
    __xlx_real_sample_31__input_buffer[i] = __xlx_real_sample_31__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_32__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_32__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_32)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_32)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_32)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_32)[j*4+3];
    __xlx_real_sample_32__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_32 = 16;
  int __xlx_offset_param_real_sample_32 = 0;
  int __xlx_offset_byte_param_real_sample_32 = 0*4;
  int* __xlx_real_sample_32__input_buffer= new int[__xlx_real_sample_32__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_32__tmp_vec.size(); ++i) {
    __xlx_real_sample_32__input_buffer[i] = __xlx_real_sample_32__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_33__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_33__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_33)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_33)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_33)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_33)[j*4+3];
    __xlx_real_sample_33__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_33 = 16;
  int __xlx_offset_param_real_sample_33 = 0;
  int __xlx_offset_byte_param_real_sample_33 = 0*4;
  int* __xlx_real_sample_33__input_buffer= new int[__xlx_real_sample_33__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_33__tmp_vec.size(); ++i) {
    __xlx_real_sample_33__input_buffer[i] = __xlx_real_sample_33__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_34__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_34__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_34)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_34)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_34)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_34)[j*4+3];
    __xlx_real_sample_34__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_34 = 16;
  int __xlx_offset_param_real_sample_34 = 0;
  int __xlx_offset_byte_param_real_sample_34 = 0*4;
  int* __xlx_real_sample_34__input_buffer= new int[__xlx_real_sample_34__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_34__tmp_vec.size(); ++i) {
    __xlx_real_sample_34__input_buffer[i] = __xlx_real_sample_34__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_35__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_35__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_35)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_35)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_35)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_35)[j*4+3];
    __xlx_real_sample_35__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_35 = 16;
  int __xlx_offset_param_real_sample_35 = 0;
  int __xlx_offset_byte_param_real_sample_35 = 0*4;
  int* __xlx_real_sample_35__input_buffer= new int[__xlx_real_sample_35__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_35__tmp_vec.size(); ++i) {
    __xlx_real_sample_35__input_buffer[i] = __xlx_real_sample_35__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_36__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_36__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_36)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_36)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_36)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_36)[j*4+3];
    __xlx_real_sample_36__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_36 = 16;
  int __xlx_offset_param_real_sample_36 = 0;
  int __xlx_offset_byte_param_real_sample_36 = 0*4;
  int* __xlx_real_sample_36__input_buffer= new int[__xlx_real_sample_36__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_36__tmp_vec.size(); ++i) {
    __xlx_real_sample_36__input_buffer[i] = __xlx_real_sample_36__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_37__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_37__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_37)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_37)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_37)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_37)[j*4+3];
    __xlx_real_sample_37__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_37 = 16;
  int __xlx_offset_param_real_sample_37 = 0;
  int __xlx_offset_byte_param_real_sample_37 = 0*4;
  int* __xlx_real_sample_37__input_buffer= new int[__xlx_real_sample_37__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_37__tmp_vec.size(); ++i) {
    __xlx_real_sample_37__input_buffer[i] = __xlx_real_sample_37__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_38__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_38__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_38)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_38)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_38)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_38)[j*4+3];
    __xlx_real_sample_38__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_38 = 16;
  int __xlx_offset_param_real_sample_38 = 0;
  int __xlx_offset_byte_param_real_sample_38 = 0*4;
  int* __xlx_real_sample_38__input_buffer= new int[__xlx_real_sample_38__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_38__tmp_vec.size(); ++i) {
    __xlx_real_sample_38__input_buffer[i] = __xlx_real_sample_38__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_39__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_39__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_39)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_39)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_39)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_39)[j*4+3];
    __xlx_real_sample_39__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_39 = 16;
  int __xlx_offset_param_real_sample_39 = 0;
  int __xlx_offset_byte_param_real_sample_39 = 0*4;
  int* __xlx_real_sample_39__input_buffer= new int[__xlx_real_sample_39__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_39__tmp_vec.size(); ++i) {
    __xlx_real_sample_39__input_buffer[i] = __xlx_real_sample_39__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_40__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_40__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_40)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_40)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_40)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_40)[j*4+3];
    __xlx_real_sample_40__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_40 = 16;
  int __xlx_offset_param_real_sample_40 = 0;
  int __xlx_offset_byte_param_real_sample_40 = 0*4;
  int* __xlx_real_sample_40__input_buffer= new int[__xlx_real_sample_40__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_40__tmp_vec.size(); ++i) {
    __xlx_real_sample_40__input_buffer[i] = __xlx_real_sample_40__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_41__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_41__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_41)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_41)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_41)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_41)[j*4+3];
    __xlx_real_sample_41__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_41 = 16;
  int __xlx_offset_param_real_sample_41 = 0;
  int __xlx_offset_byte_param_real_sample_41 = 0*4;
  int* __xlx_real_sample_41__input_buffer= new int[__xlx_real_sample_41__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_41__tmp_vec.size(); ++i) {
    __xlx_real_sample_41__input_buffer[i] = __xlx_real_sample_41__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_42__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_42__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_42)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_42)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_42)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_42)[j*4+3];
    __xlx_real_sample_42__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_42 = 16;
  int __xlx_offset_param_real_sample_42 = 0;
  int __xlx_offset_byte_param_real_sample_42 = 0*4;
  int* __xlx_real_sample_42__input_buffer= new int[__xlx_real_sample_42__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_42__tmp_vec.size(); ++i) {
    __xlx_real_sample_42__input_buffer[i] = __xlx_real_sample_42__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_43__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_43__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_43)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_43)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_43)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_43)[j*4+3];
    __xlx_real_sample_43__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_43 = 16;
  int __xlx_offset_param_real_sample_43 = 0;
  int __xlx_offset_byte_param_real_sample_43 = 0*4;
  int* __xlx_real_sample_43__input_buffer= new int[__xlx_real_sample_43__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_43__tmp_vec.size(); ++i) {
    __xlx_real_sample_43__input_buffer[i] = __xlx_real_sample_43__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_44__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_44__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_44)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_44)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_44)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_44)[j*4+3];
    __xlx_real_sample_44__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_44 = 16;
  int __xlx_offset_param_real_sample_44 = 0;
  int __xlx_offset_byte_param_real_sample_44 = 0*4;
  int* __xlx_real_sample_44__input_buffer= new int[__xlx_real_sample_44__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_44__tmp_vec.size(); ++i) {
    __xlx_real_sample_44__input_buffer[i] = __xlx_real_sample_44__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_45__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_45__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_45)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_45)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_45)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_45)[j*4+3];
    __xlx_real_sample_45__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_45 = 16;
  int __xlx_offset_param_real_sample_45 = 0;
  int __xlx_offset_byte_param_real_sample_45 = 0*4;
  int* __xlx_real_sample_45__input_buffer= new int[__xlx_real_sample_45__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_45__tmp_vec.size(); ++i) {
    __xlx_real_sample_45__input_buffer[i] = __xlx_real_sample_45__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_46__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_46__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_46)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_46)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_46)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_46)[j*4+3];
    __xlx_real_sample_46__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_46 = 16;
  int __xlx_offset_param_real_sample_46 = 0;
  int __xlx_offset_byte_param_real_sample_46 = 0*4;
  int* __xlx_real_sample_46__input_buffer= new int[__xlx_real_sample_46__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_46__tmp_vec.size(); ++i) {
    __xlx_real_sample_46__input_buffer[i] = __xlx_real_sample_46__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_47__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_47__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_47)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_47)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_47)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_47)[j*4+3];
    __xlx_real_sample_47__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_47 = 16;
  int __xlx_offset_param_real_sample_47 = 0;
  int __xlx_offset_byte_param_real_sample_47 = 0*4;
  int* __xlx_real_sample_47__input_buffer= new int[__xlx_real_sample_47__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_47__tmp_vec.size(); ++i) {
    __xlx_real_sample_47__input_buffer[i] = __xlx_real_sample_47__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_48__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_48__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_48)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_48)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_48)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_48)[j*4+3];
    __xlx_real_sample_48__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_48 = 16;
  int __xlx_offset_param_real_sample_48 = 0;
  int __xlx_offset_byte_param_real_sample_48 = 0*4;
  int* __xlx_real_sample_48__input_buffer= new int[__xlx_real_sample_48__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_48__tmp_vec.size(); ++i) {
    __xlx_real_sample_48__input_buffer[i] = __xlx_real_sample_48__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_49__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_49__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_49)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_49)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_49)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_49)[j*4+3];
    __xlx_real_sample_49__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_49 = 16;
  int __xlx_offset_param_real_sample_49 = 0;
  int __xlx_offset_byte_param_real_sample_49 = 0*4;
  int* __xlx_real_sample_49__input_buffer= new int[__xlx_real_sample_49__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_49__tmp_vec.size(); ++i) {
    __xlx_real_sample_49__input_buffer[i] = __xlx_real_sample_49__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_50__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_50__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_50)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_50)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_50)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_50)[j*4+3];
    __xlx_real_sample_50__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_50 = 16;
  int __xlx_offset_param_real_sample_50 = 0;
  int __xlx_offset_byte_param_real_sample_50 = 0*4;
  int* __xlx_real_sample_50__input_buffer= new int[__xlx_real_sample_50__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_50__tmp_vec.size(); ++i) {
    __xlx_real_sample_50__input_buffer[i] = __xlx_real_sample_50__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_51__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_51__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_51)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_51)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_51)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_51)[j*4+3];
    __xlx_real_sample_51__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_51 = 16;
  int __xlx_offset_param_real_sample_51 = 0;
  int __xlx_offset_byte_param_real_sample_51 = 0*4;
  int* __xlx_real_sample_51__input_buffer= new int[__xlx_real_sample_51__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_51__tmp_vec.size(); ++i) {
    __xlx_real_sample_51__input_buffer[i] = __xlx_real_sample_51__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_52__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_52__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_52)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_52)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_52)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_52)[j*4+3];
    __xlx_real_sample_52__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_52 = 16;
  int __xlx_offset_param_real_sample_52 = 0;
  int __xlx_offset_byte_param_real_sample_52 = 0*4;
  int* __xlx_real_sample_52__input_buffer= new int[__xlx_real_sample_52__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_52__tmp_vec.size(); ++i) {
    __xlx_real_sample_52__input_buffer[i] = __xlx_real_sample_52__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_53__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_53__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_53)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_53)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_53)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_53)[j*4+3];
    __xlx_real_sample_53__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_53 = 16;
  int __xlx_offset_param_real_sample_53 = 0;
  int __xlx_offset_byte_param_real_sample_53 = 0*4;
  int* __xlx_real_sample_53__input_buffer= new int[__xlx_real_sample_53__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_53__tmp_vec.size(); ++i) {
    __xlx_real_sample_53__input_buffer[i] = __xlx_real_sample_53__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_54__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_54__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_54)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_54)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_54)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_54)[j*4+3];
    __xlx_real_sample_54__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_54 = 16;
  int __xlx_offset_param_real_sample_54 = 0;
  int __xlx_offset_byte_param_real_sample_54 = 0*4;
  int* __xlx_real_sample_54__input_buffer= new int[__xlx_real_sample_54__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_54__tmp_vec.size(); ++i) {
    __xlx_real_sample_54__input_buffer[i] = __xlx_real_sample_54__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_55__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_55__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_55)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_55)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_55)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_55)[j*4+3];
    __xlx_real_sample_55__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_55 = 16;
  int __xlx_offset_param_real_sample_55 = 0;
  int __xlx_offset_byte_param_real_sample_55 = 0*4;
  int* __xlx_real_sample_55__input_buffer= new int[__xlx_real_sample_55__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_55__tmp_vec.size(); ++i) {
    __xlx_real_sample_55__input_buffer[i] = __xlx_real_sample_55__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_56__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_56__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_56)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_56)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_56)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_56)[j*4+3];
    __xlx_real_sample_56__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_56 = 16;
  int __xlx_offset_param_real_sample_56 = 0;
  int __xlx_offset_byte_param_real_sample_56 = 0*4;
  int* __xlx_real_sample_56__input_buffer= new int[__xlx_real_sample_56__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_56__tmp_vec.size(); ++i) {
    __xlx_real_sample_56__input_buffer[i] = __xlx_real_sample_56__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_57__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_57__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_57)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_57)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_57)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_57)[j*4+3];
    __xlx_real_sample_57__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_57 = 16;
  int __xlx_offset_param_real_sample_57 = 0;
  int __xlx_offset_byte_param_real_sample_57 = 0*4;
  int* __xlx_real_sample_57__input_buffer= new int[__xlx_real_sample_57__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_57__tmp_vec.size(); ++i) {
    __xlx_real_sample_57__input_buffer[i] = __xlx_real_sample_57__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_58__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_58__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_58)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_58)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_58)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_58)[j*4+3];
    __xlx_real_sample_58__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_58 = 16;
  int __xlx_offset_param_real_sample_58 = 0;
  int __xlx_offset_byte_param_real_sample_58 = 0*4;
  int* __xlx_real_sample_58__input_buffer= new int[__xlx_real_sample_58__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_58__tmp_vec.size(); ++i) {
    __xlx_real_sample_58__input_buffer[i] = __xlx_real_sample_58__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_59__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_59__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_59)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_59)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_59)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_59)[j*4+3];
    __xlx_real_sample_59__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_59 = 16;
  int __xlx_offset_param_real_sample_59 = 0;
  int __xlx_offset_byte_param_real_sample_59 = 0*4;
  int* __xlx_real_sample_59__input_buffer= new int[__xlx_real_sample_59__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_59__tmp_vec.size(); ++i) {
    __xlx_real_sample_59__input_buffer[i] = __xlx_real_sample_59__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_60__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_60__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_60)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_60)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_60)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_60)[j*4+3];
    __xlx_real_sample_60__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_60 = 16;
  int __xlx_offset_param_real_sample_60 = 0;
  int __xlx_offset_byte_param_real_sample_60 = 0*4;
  int* __xlx_real_sample_60__input_buffer= new int[__xlx_real_sample_60__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_60__tmp_vec.size(); ++i) {
    __xlx_real_sample_60__input_buffer[i] = __xlx_real_sample_60__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_61__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_61__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_61)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_61)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_61)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_61)[j*4+3];
    __xlx_real_sample_61__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_61 = 16;
  int __xlx_offset_param_real_sample_61 = 0;
  int __xlx_offset_byte_param_real_sample_61 = 0*4;
  int* __xlx_real_sample_61__input_buffer= new int[__xlx_real_sample_61__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_61__tmp_vec.size(); ++i) {
    __xlx_real_sample_61__input_buffer[i] = __xlx_real_sample_61__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_62__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_62__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_62)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_62)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_62)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_62)[j*4+3];
    __xlx_real_sample_62__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_62 = 16;
  int __xlx_offset_param_real_sample_62 = 0;
  int __xlx_offset_byte_param_real_sample_62 = 0*4;
  int* __xlx_real_sample_62__input_buffer= new int[__xlx_real_sample_62__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_62__tmp_vec.size(); ++i) {
    __xlx_real_sample_62__input_buffer[i] = __xlx_real_sample_62__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_sample_63__tmp_vec
  vector<sc_bv<32> >__xlx_real_sample_63__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_sample_63)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_sample_63)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_sample_63)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_sample_63)[j*4+3];
    __xlx_real_sample_63__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_sample_63 = 16;
  int __xlx_offset_param_real_sample_63 = 0;
  int __xlx_offset_byte_param_real_sample_63 = 0*4;
  int* __xlx_real_sample_63__input_buffer= new int[__xlx_real_sample_63__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_sample_63__tmp_vec.size(); ++i) {
    __xlx_real_sample_63__input_buffer[i] = __xlx_real_sample_63__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_0__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_0__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_0)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_0)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_0)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_0)[j*4+3];
    __xlx_imag_sample_0__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_0 = 16;
  int __xlx_offset_param_imag_sample_0 = 0;
  int __xlx_offset_byte_param_imag_sample_0 = 0*4;
  int* __xlx_imag_sample_0__input_buffer= new int[__xlx_imag_sample_0__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_0__tmp_vec.size(); ++i) {
    __xlx_imag_sample_0__input_buffer[i] = __xlx_imag_sample_0__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_1__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_1__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_1)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_1)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_1)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_1)[j*4+3];
    __xlx_imag_sample_1__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_1 = 16;
  int __xlx_offset_param_imag_sample_1 = 0;
  int __xlx_offset_byte_param_imag_sample_1 = 0*4;
  int* __xlx_imag_sample_1__input_buffer= new int[__xlx_imag_sample_1__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_1__tmp_vec.size(); ++i) {
    __xlx_imag_sample_1__input_buffer[i] = __xlx_imag_sample_1__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_2__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_2__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_2)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_2)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_2)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_2)[j*4+3];
    __xlx_imag_sample_2__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_2 = 16;
  int __xlx_offset_param_imag_sample_2 = 0;
  int __xlx_offset_byte_param_imag_sample_2 = 0*4;
  int* __xlx_imag_sample_2__input_buffer= new int[__xlx_imag_sample_2__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_2__tmp_vec.size(); ++i) {
    __xlx_imag_sample_2__input_buffer[i] = __xlx_imag_sample_2__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_3__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_3__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_3)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_3)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_3)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_3)[j*4+3];
    __xlx_imag_sample_3__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_3 = 16;
  int __xlx_offset_param_imag_sample_3 = 0;
  int __xlx_offset_byte_param_imag_sample_3 = 0*4;
  int* __xlx_imag_sample_3__input_buffer= new int[__xlx_imag_sample_3__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_3__tmp_vec.size(); ++i) {
    __xlx_imag_sample_3__input_buffer[i] = __xlx_imag_sample_3__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_4__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_4__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_4)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_4)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_4)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_4)[j*4+3];
    __xlx_imag_sample_4__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_4 = 16;
  int __xlx_offset_param_imag_sample_4 = 0;
  int __xlx_offset_byte_param_imag_sample_4 = 0*4;
  int* __xlx_imag_sample_4__input_buffer= new int[__xlx_imag_sample_4__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_4__tmp_vec.size(); ++i) {
    __xlx_imag_sample_4__input_buffer[i] = __xlx_imag_sample_4__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_5__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_5__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_5)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_5)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_5)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_5)[j*4+3];
    __xlx_imag_sample_5__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_5 = 16;
  int __xlx_offset_param_imag_sample_5 = 0;
  int __xlx_offset_byte_param_imag_sample_5 = 0*4;
  int* __xlx_imag_sample_5__input_buffer= new int[__xlx_imag_sample_5__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_5__tmp_vec.size(); ++i) {
    __xlx_imag_sample_5__input_buffer[i] = __xlx_imag_sample_5__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_6__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_6__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_6)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_6)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_6)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_6)[j*4+3];
    __xlx_imag_sample_6__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_6 = 16;
  int __xlx_offset_param_imag_sample_6 = 0;
  int __xlx_offset_byte_param_imag_sample_6 = 0*4;
  int* __xlx_imag_sample_6__input_buffer= new int[__xlx_imag_sample_6__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_6__tmp_vec.size(); ++i) {
    __xlx_imag_sample_6__input_buffer[i] = __xlx_imag_sample_6__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_7__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_7__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_7)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_7)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_7)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_7)[j*4+3];
    __xlx_imag_sample_7__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_7 = 16;
  int __xlx_offset_param_imag_sample_7 = 0;
  int __xlx_offset_byte_param_imag_sample_7 = 0*4;
  int* __xlx_imag_sample_7__input_buffer= new int[__xlx_imag_sample_7__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_7__tmp_vec.size(); ++i) {
    __xlx_imag_sample_7__input_buffer[i] = __xlx_imag_sample_7__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_8__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_8__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_8)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_8)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_8)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_8)[j*4+3];
    __xlx_imag_sample_8__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_8 = 16;
  int __xlx_offset_param_imag_sample_8 = 0;
  int __xlx_offset_byte_param_imag_sample_8 = 0*4;
  int* __xlx_imag_sample_8__input_buffer= new int[__xlx_imag_sample_8__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_8__tmp_vec.size(); ++i) {
    __xlx_imag_sample_8__input_buffer[i] = __xlx_imag_sample_8__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_9__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_9__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_9)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_9)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_9)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_9)[j*4+3];
    __xlx_imag_sample_9__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_9 = 16;
  int __xlx_offset_param_imag_sample_9 = 0;
  int __xlx_offset_byte_param_imag_sample_9 = 0*4;
  int* __xlx_imag_sample_9__input_buffer= new int[__xlx_imag_sample_9__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_9__tmp_vec.size(); ++i) {
    __xlx_imag_sample_9__input_buffer[i] = __xlx_imag_sample_9__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_10__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_10__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_10)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_10)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_10)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_10)[j*4+3];
    __xlx_imag_sample_10__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_10 = 16;
  int __xlx_offset_param_imag_sample_10 = 0;
  int __xlx_offset_byte_param_imag_sample_10 = 0*4;
  int* __xlx_imag_sample_10__input_buffer= new int[__xlx_imag_sample_10__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_10__tmp_vec.size(); ++i) {
    __xlx_imag_sample_10__input_buffer[i] = __xlx_imag_sample_10__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_11__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_11__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_11)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_11)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_11)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_11)[j*4+3];
    __xlx_imag_sample_11__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_11 = 16;
  int __xlx_offset_param_imag_sample_11 = 0;
  int __xlx_offset_byte_param_imag_sample_11 = 0*4;
  int* __xlx_imag_sample_11__input_buffer= new int[__xlx_imag_sample_11__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_11__tmp_vec.size(); ++i) {
    __xlx_imag_sample_11__input_buffer[i] = __xlx_imag_sample_11__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_12__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_12__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_12)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_12)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_12)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_12)[j*4+3];
    __xlx_imag_sample_12__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_12 = 16;
  int __xlx_offset_param_imag_sample_12 = 0;
  int __xlx_offset_byte_param_imag_sample_12 = 0*4;
  int* __xlx_imag_sample_12__input_buffer= new int[__xlx_imag_sample_12__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_12__tmp_vec.size(); ++i) {
    __xlx_imag_sample_12__input_buffer[i] = __xlx_imag_sample_12__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_13__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_13__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_13)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_13)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_13)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_13)[j*4+3];
    __xlx_imag_sample_13__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_13 = 16;
  int __xlx_offset_param_imag_sample_13 = 0;
  int __xlx_offset_byte_param_imag_sample_13 = 0*4;
  int* __xlx_imag_sample_13__input_buffer= new int[__xlx_imag_sample_13__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_13__tmp_vec.size(); ++i) {
    __xlx_imag_sample_13__input_buffer[i] = __xlx_imag_sample_13__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_14__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_14__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_14)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_14)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_14)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_14)[j*4+3];
    __xlx_imag_sample_14__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_14 = 16;
  int __xlx_offset_param_imag_sample_14 = 0;
  int __xlx_offset_byte_param_imag_sample_14 = 0*4;
  int* __xlx_imag_sample_14__input_buffer= new int[__xlx_imag_sample_14__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_14__tmp_vec.size(); ++i) {
    __xlx_imag_sample_14__input_buffer[i] = __xlx_imag_sample_14__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_15__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_15__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_15)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_15)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_15)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_15)[j*4+3];
    __xlx_imag_sample_15__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_15 = 16;
  int __xlx_offset_param_imag_sample_15 = 0;
  int __xlx_offset_byte_param_imag_sample_15 = 0*4;
  int* __xlx_imag_sample_15__input_buffer= new int[__xlx_imag_sample_15__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_15__tmp_vec.size(); ++i) {
    __xlx_imag_sample_15__input_buffer[i] = __xlx_imag_sample_15__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_16__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_16__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_16)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_16)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_16)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_16)[j*4+3];
    __xlx_imag_sample_16__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_16 = 16;
  int __xlx_offset_param_imag_sample_16 = 0;
  int __xlx_offset_byte_param_imag_sample_16 = 0*4;
  int* __xlx_imag_sample_16__input_buffer= new int[__xlx_imag_sample_16__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_16__tmp_vec.size(); ++i) {
    __xlx_imag_sample_16__input_buffer[i] = __xlx_imag_sample_16__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_17__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_17__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_17)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_17)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_17)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_17)[j*4+3];
    __xlx_imag_sample_17__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_17 = 16;
  int __xlx_offset_param_imag_sample_17 = 0;
  int __xlx_offset_byte_param_imag_sample_17 = 0*4;
  int* __xlx_imag_sample_17__input_buffer= new int[__xlx_imag_sample_17__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_17__tmp_vec.size(); ++i) {
    __xlx_imag_sample_17__input_buffer[i] = __xlx_imag_sample_17__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_18__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_18__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_18)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_18)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_18)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_18)[j*4+3];
    __xlx_imag_sample_18__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_18 = 16;
  int __xlx_offset_param_imag_sample_18 = 0;
  int __xlx_offset_byte_param_imag_sample_18 = 0*4;
  int* __xlx_imag_sample_18__input_buffer= new int[__xlx_imag_sample_18__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_18__tmp_vec.size(); ++i) {
    __xlx_imag_sample_18__input_buffer[i] = __xlx_imag_sample_18__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_19__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_19__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_19)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_19)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_19)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_19)[j*4+3];
    __xlx_imag_sample_19__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_19 = 16;
  int __xlx_offset_param_imag_sample_19 = 0;
  int __xlx_offset_byte_param_imag_sample_19 = 0*4;
  int* __xlx_imag_sample_19__input_buffer= new int[__xlx_imag_sample_19__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_19__tmp_vec.size(); ++i) {
    __xlx_imag_sample_19__input_buffer[i] = __xlx_imag_sample_19__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_20__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_20__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_20)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_20)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_20)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_20)[j*4+3];
    __xlx_imag_sample_20__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_20 = 16;
  int __xlx_offset_param_imag_sample_20 = 0;
  int __xlx_offset_byte_param_imag_sample_20 = 0*4;
  int* __xlx_imag_sample_20__input_buffer= new int[__xlx_imag_sample_20__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_20__tmp_vec.size(); ++i) {
    __xlx_imag_sample_20__input_buffer[i] = __xlx_imag_sample_20__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_21__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_21__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_21)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_21)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_21)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_21)[j*4+3];
    __xlx_imag_sample_21__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_21 = 16;
  int __xlx_offset_param_imag_sample_21 = 0;
  int __xlx_offset_byte_param_imag_sample_21 = 0*4;
  int* __xlx_imag_sample_21__input_buffer= new int[__xlx_imag_sample_21__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_21__tmp_vec.size(); ++i) {
    __xlx_imag_sample_21__input_buffer[i] = __xlx_imag_sample_21__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_22__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_22__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_22)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_22)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_22)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_22)[j*4+3];
    __xlx_imag_sample_22__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_22 = 16;
  int __xlx_offset_param_imag_sample_22 = 0;
  int __xlx_offset_byte_param_imag_sample_22 = 0*4;
  int* __xlx_imag_sample_22__input_buffer= new int[__xlx_imag_sample_22__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_22__tmp_vec.size(); ++i) {
    __xlx_imag_sample_22__input_buffer[i] = __xlx_imag_sample_22__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_23__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_23__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_23)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_23)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_23)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_23)[j*4+3];
    __xlx_imag_sample_23__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_23 = 16;
  int __xlx_offset_param_imag_sample_23 = 0;
  int __xlx_offset_byte_param_imag_sample_23 = 0*4;
  int* __xlx_imag_sample_23__input_buffer= new int[__xlx_imag_sample_23__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_23__tmp_vec.size(); ++i) {
    __xlx_imag_sample_23__input_buffer[i] = __xlx_imag_sample_23__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_24__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_24__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_24)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_24)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_24)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_24)[j*4+3];
    __xlx_imag_sample_24__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_24 = 16;
  int __xlx_offset_param_imag_sample_24 = 0;
  int __xlx_offset_byte_param_imag_sample_24 = 0*4;
  int* __xlx_imag_sample_24__input_buffer= new int[__xlx_imag_sample_24__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_24__tmp_vec.size(); ++i) {
    __xlx_imag_sample_24__input_buffer[i] = __xlx_imag_sample_24__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_25__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_25__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_25)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_25)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_25)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_25)[j*4+3];
    __xlx_imag_sample_25__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_25 = 16;
  int __xlx_offset_param_imag_sample_25 = 0;
  int __xlx_offset_byte_param_imag_sample_25 = 0*4;
  int* __xlx_imag_sample_25__input_buffer= new int[__xlx_imag_sample_25__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_25__tmp_vec.size(); ++i) {
    __xlx_imag_sample_25__input_buffer[i] = __xlx_imag_sample_25__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_26__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_26__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_26)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_26)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_26)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_26)[j*4+3];
    __xlx_imag_sample_26__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_26 = 16;
  int __xlx_offset_param_imag_sample_26 = 0;
  int __xlx_offset_byte_param_imag_sample_26 = 0*4;
  int* __xlx_imag_sample_26__input_buffer= new int[__xlx_imag_sample_26__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_26__tmp_vec.size(); ++i) {
    __xlx_imag_sample_26__input_buffer[i] = __xlx_imag_sample_26__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_27__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_27__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_27)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_27)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_27)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_27)[j*4+3];
    __xlx_imag_sample_27__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_27 = 16;
  int __xlx_offset_param_imag_sample_27 = 0;
  int __xlx_offset_byte_param_imag_sample_27 = 0*4;
  int* __xlx_imag_sample_27__input_buffer= new int[__xlx_imag_sample_27__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_27__tmp_vec.size(); ++i) {
    __xlx_imag_sample_27__input_buffer[i] = __xlx_imag_sample_27__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_28__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_28__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_28)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_28)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_28)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_28)[j*4+3];
    __xlx_imag_sample_28__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_28 = 16;
  int __xlx_offset_param_imag_sample_28 = 0;
  int __xlx_offset_byte_param_imag_sample_28 = 0*4;
  int* __xlx_imag_sample_28__input_buffer= new int[__xlx_imag_sample_28__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_28__tmp_vec.size(); ++i) {
    __xlx_imag_sample_28__input_buffer[i] = __xlx_imag_sample_28__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_29__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_29__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_29)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_29)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_29)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_29)[j*4+3];
    __xlx_imag_sample_29__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_29 = 16;
  int __xlx_offset_param_imag_sample_29 = 0;
  int __xlx_offset_byte_param_imag_sample_29 = 0*4;
  int* __xlx_imag_sample_29__input_buffer= new int[__xlx_imag_sample_29__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_29__tmp_vec.size(); ++i) {
    __xlx_imag_sample_29__input_buffer[i] = __xlx_imag_sample_29__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_30__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_30__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_30)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_30)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_30)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_30)[j*4+3];
    __xlx_imag_sample_30__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_30 = 16;
  int __xlx_offset_param_imag_sample_30 = 0;
  int __xlx_offset_byte_param_imag_sample_30 = 0*4;
  int* __xlx_imag_sample_30__input_buffer= new int[__xlx_imag_sample_30__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_30__tmp_vec.size(); ++i) {
    __xlx_imag_sample_30__input_buffer[i] = __xlx_imag_sample_30__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_31__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_31__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_31)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_31)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_31)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_31)[j*4+3];
    __xlx_imag_sample_31__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_31 = 16;
  int __xlx_offset_param_imag_sample_31 = 0;
  int __xlx_offset_byte_param_imag_sample_31 = 0*4;
  int* __xlx_imag_sample_31__input_buffer= new int[__xlx_imag_sample_31__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_31__tmp_vec.size(); ++i) {
    __xlx_imag_sample_31__input_buffer[i] = __xlx_imag_sample_31__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_32__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_32__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_32)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_32)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_32)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_32)[j*4+3];
    __xlx_imag_sample_32__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_32 = 16;
  int __xlx_offset_param_imag_sample_32 = 0;
  int __xlx_offset_byte_param_imag_sample_32 = 0*4;
  int* __xlx_imag_sample_32__input_buffer= new int[__xlx_imag_sample_32__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_32__tmp_vec.size(); ++i) {
    __xlx_imag_sample_32__input_buffer[i] = __xlx_imag_sample_32__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_33__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_33__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_33)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_33)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_33)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_33)[j*4+3];
    __xlx_imag_sample_33__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_33 = 16;
  int __xlx_offset_param_imag_sample_33 = 0;
  int __xlx_offset_byte_param_imag_sample_33 = 0*4;
  int* __xlx_imag_sample_33__input_buffer= new int[__xlx_imag_sample_33__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_33__tmp_vec.size(); ++i) {
    __xlx_imag_sample_33__input_buffer[i] = __xlx_imag_sample_33__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_34__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_34__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_34)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_34)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_34)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_34)[j*4+3];
    __xlx_imag_sample_34__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_34 = 16;
  int __xlx_offset_param_imag_sample_34 = 0;
  int __xlx_offset_byte_param_imag_sample_34 = 0*4;
  int* __xlx_imag_sample_34__input_buffer= new int[__xlx_imag_sample_34__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_34__tmp_vec.size(); ++i) {
    __xlx_imag_sample_34__input_buffer[i] = __xlx_imag_sample_34__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_35__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_35__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_35)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_35)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_35)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_35)[j*4+3];
    __xlx_imag_sample_35__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_35 = 16;
  int __xlx_offset_param_imag_sample_35 = 0;
  int __xlx_offset_byte_param_imag_sample_35 = 0*4;
  int* __xlx_imag_sample_35__input_buffer= new int[__xlx_imag_sample_35__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_35__tmp_vec.size(); ++i) {
    __xlx_imag_sample_35__input_buffer[i] = __xlx_imag_sample_35__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_36__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_36__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_36)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_36)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_36)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_36)[j*4+3];
    __xlx_imag_sample_36__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_36 = 16;
  int __xlx_offset_param_imag_sample_36 = 0;
  int __xlx_offset_byte_param_imag_sample_36 = 0*4;
  int* __xlx_imag_sample_36__input_buffer= new int[__xlx_imag_sample_36__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_36__tmp_vec.size(); ++i) {
    __xlx_imag_sample_36__input_buffer[i] = __xlx_imag_sample_36__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_37__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_37__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_37)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_37)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_37)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_37)[j*4+3];
    __xlx_imag_sample_37__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_37 = 16;
  int __xlx_offset_param_imag_sample_37 = 0;
  int __xlx_offset_byte_param_imag_sample_37 = 0*4;
  int* __xlx_imag_sample_37__input_buffer= new int[__xlx_imag_sample_37__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_37__tmp_vec.size(); ++i) {
    __xlx_imag_sample_37__input_buffer[i] = __xlx_imag_sample_37__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_38__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_38__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_38)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_38)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_38)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_38)[j*4+3];
    __xlx_imag_sample_38__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_38 = 16;
  int __xlx_offset_param_imag_sample_38 = 0;
  int __xlx_offset_byte_param_imag_sample_38 = 0*4;
  int* __xlx_imag_sample_38__input_buffer= new int[__xlx_imag_sample_38__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_38__tmp_vec.size(); ++i) {
    __xlx_imag_sample_38__input_buffer[i] = __xlx_imag_sample_38__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_39__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_39__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_39)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_39)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_39)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_39)[j*4+3];
    __xlx_imag_sample_39__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_39 = 16;
  int __xlx_offset_param_imag_sample_39 = 0;
  int __xlx_offset_byte_param_imag_sample_39 = 0*4;
  int* __xlx_imag_sample_39__input_buffer= new int[__xlx_imag_sample_39__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_39__tmp_vec.size(); ++i) {
    __xlx_imag_sample_39__input_buffer[i] = __xlx_imag_sample_39__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_40__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_40__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_40)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_40)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_40)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_40)[j*4+3];
    __xlx_imag_sample_40__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_40 = 16;
  int __xlx_offset_param_imag_sample_40 = 0;
  int __xlx_offset_byte_param_imag_sample_40 = 0*4;
  int* __xlx_imag_sample_40__input_buffer= new int[__xlx_imag_sample_40__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_40__tmp_vec.size(); ++i) {
    __xlx_imag_sample_40__input_buffer[i] = __xlx_imag_sample_40__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_41__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_41__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_41)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_41)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_41)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_41)[j*4+3];
    __xlx_imag_sample_41__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_41 = 16;
  int __xlx_offset_param_imag_sample_41 = 0;
  int __xlx_offset_byte_param_imag_sample_41 = 0*4;
  int* __xlx_imag_sample_41__input_buffer= new int[__xlx_imag_sample_41__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_41__tmp_vec.size(); ++i) {
    __xlx_imag_sample_41__input_buffer[i] = __xlx_imag_sample_41__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_42__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_42__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_42)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_42)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_42)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_42)[j*4+3];
    __xlx_imag_sample_42__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_42 = 16;
  int __xlx_offset_param_imag_sample_42 = 0;
  int __xlx_offset_byte_param_imag_sample_42 = 0*4;
  int* __xlx_imag_sample_42__input_buffer= new int[__xlx_imag_sample_42__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_42__tmp_vec.size(); ++i) {
    __xlx_imag_sample_42__input_buffer[i] = __xlx_imag_sample_42__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_43__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_43__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_43)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_43)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_43)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_43)[j*4+3];
    __xlx_imag_sample_43__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_43 = 16;
  int __xlx_offset_param_imag_sample_43 = 0;
  int __xlx_offset_byte_param_imag_sample_43 = 0*4;
  int* __xlx_imag_sample_43__input_buffer= new int[__xlx_imag_sample_43__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_43__tmp_vec.size(); ++i) {
    __xlx_imag_sample_43__input_buffer[i] = __xlx_imag_sample_43__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_44__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_44__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_44)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_44)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_44)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_44)[j*4+3];
    __xlx_imag_sample_44__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_44 = 16;
  int __xlx_offset_param_imag_sample_44 = 0;
  int __xlx_offset_byte_param_imag_sample_44 = 0*4;
  int* __xlx_imag_sample_44__input_buffer= new int[__xlx_imag_sample_44__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_44__tmp_vec.size(); ++i) {
    __xlx_imag_sample_44__input_buffer[i] = __xlx_imag_sample_44__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_45__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_45__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_45)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_45)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_45)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_45)[j*4+3];
    __xlx_imag_sample_45__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_45 = 16;
  int __xlx_offset_param_imag_sample_45 = 0;
  int __xlx_offset_byte_param_imag_sample_45 = 0*4;
  int* __xlx_imag_sample_45__input_buffer= new int[__xlx_imag_sample_45__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_45__tmp_vec.size(); ++i) {
    __xlx_imag_sample_45__input_buffer[i] = __xlx_imag_sample_45__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_46__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_46__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_46)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_46)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_46)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_46)[j*4+3];
    __xlx_imag_sample_46__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_46 = 16;
  int __xlx_offset_param_imag_sample_46 = 0;
  int __xlx_offset_byte_param_imag_sample_46 = 0*4;
  int* __xlx_imag_sample_46__input_buffer= new int[__xlx_imag_sample_46__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_46__tmp_vec.size(); ++i) {
    __xlx_imag_sample_46__input_buffer[i] = __xlx_imag_sample_46__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_47__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_47__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_47)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_47)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_47)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_47)[j*4+3];
    __xlx_imag_sample_47__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_47 = 16;
  int __xlx_offset_param_imag_sample_47 = 0;
  int __xlx_offset_byte_param_imag_sample_47 = 0*4;
  int* __xlx_imag_sample_47__input_buffer= new int[__xlx_imag_sample_47__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_47__tmp_vec.size(); ++i) {
    __xlx_imag_sample_47__input_buffer[i] = __xlx_imag_sample_47__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_48__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_48__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_48)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_48)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_48)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_48)[j*4+3];
    __xlx_imag_sample_48__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_48 = 16;
  int __xlx_offset_param_imag_sample_48 = 0;
  int __xlx_offset_byte_param_imag_sample_48 = 0*4;
  int* __xlx_imag_sample_48__input_buffer= new int[__xlx_imag_sample_48__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_48__tmp_vec.size(); ++i) {
    __xlx_imag_sample_48__input_buffer[i] = __xlx_imag_sample_48__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_49__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_49__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_49)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_49)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_49)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_49)[j*4+3];
    __xlx_imag_sample_49__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_49 = 16;
  int __xlx_offset_param_imag_sample_49 = 0;
  int __xlx_offset_byte_param_imag_sample_49 = 0*4;
  int* __xlx_imag_sample_49__input_buffer= new int[__xlx_imag_sample_49__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_49__tmp_vec.size(); ++i) {
    __xlx_imag_sample_49__input_buffer[i] = __xlx_imag_sample_49__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_50__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_50__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_50)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_50)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_50)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_50)[j*4+3];
    __xlx_imag_sample_50__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_50 = 16;
  int __xlx_offset_param_imag_sample_50 = 0;
  int __xlx_offset_byte_param_imag_sample_50 = 0*4;
  int* __xlx_imag_sample_50__input_buffer= new int[__xlx_imag_sample_50__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_50__tmp_vec.size(); ++i) {
    __xlx_imag_sample_50__input_buffer[i] = __xlx_imag_sample_50__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_51__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_51__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_51)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_51)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_51)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_51)[j*4+3];
    __xlx_imag_sample_51__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_51 = 16;
  int __xlx_offset_param_imag_sample_51 = 0;
  int __xlx_offset_byte_param_imag_sample_51 = 0*4;
  int* __xlx_imag_sample_51__input_buffer= new int[__xlx_imag_sample_51__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_51__tmp_vec.size(); ++i) {
    __xlx_imag_sample_51__input_buffer[i] = __xlx_imag_sample_51__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_52__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_52__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_52)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_52)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_52)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_52)[j*4+3];
    __xlx_imag_sample_52__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_52 = 16;
  int __xlx_offset_param_imag_sample_52 = 0;
  int __xlx_offset_byte_param_imag_sample_52 = 0*4;
  int* __xlx_imag_sample_52__input_buffer= new int[__xlx_imag_sample_52__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_52__tmp_vec.size(); ++i) {
    __xlx_imag_sample_52__input_buffer[i] = __xlx_imag_sample_52__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_53__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_53__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_53)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_53)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_53)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_53)[j*4+3];
    __xlx_imag_sample_53__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_53 = 16;
  int __xlx_offset_param_imag_sample_53 = 0;
  int __xlx_offset_byte_param_imag_sample_53 = 0*4;
  int* __xlx_imag_sample_53__input_buffer= new int[__xlx_imag_sample_53__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_53__tmp_vec.size(); ++i) {
    __xlx_imag_sample_53__input_buffer[i] = __xlx_imag_sample_53__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_54__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_54__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_54)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_54)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_54)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_54)[j*4+3];
    __xlx_imag_sample_54__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_54 = 16;
  int __xlx_offset_param_imag_sample_54 = 0;
  int __xlx_offset_byte_param_imag_sample_54 = 0*4;
  int* __xlx_imag_sample_54__input_buffer= new int[__xlx_imag_sample_54__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_54__tmp_vec.size(); ++i) {
    __xlx_imag_sample_54__input_buffer[i] = __xlx_imag_sample_54__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_55__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_55__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_55)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_55)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_55)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_55)[j*4+3];
    __xlx_imag_sample_55__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_55 = 16;
  int __xlx_offset_param_imag_sample_55 = 0;
  int __xlx_offset_byte_param_imag_sample_55 = 0*4;
  int* __xlx_imag_sample_55__input_buffer= new int[__xlx_imag_sample_55__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_55__tmp_vec.size(); ++i) {
    __xlx_imag_sample_55__input_buffer[i] = __xlx_imag_sample_55__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_56__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_56__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_56)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_56)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_56)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_56)[j*4+3];
    __xlx_imag_sample_56__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_56 = 16;
  int __xlx_offset_param_imag_sample_56 = 0;
  int __xlx_offset_byte_param_imag_sample_56 = 0*4;
  int* __xlx_imag_sample_56__input_buffer= new int[__xlx_imag_sample_56__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_56__tmp_vec.size(); ++i) {
    __xlx_imag_sample_56__input_buffer[i] = __xlx_imag_sample_56__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_57__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_57__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_57)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_57)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_57)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_57)[j*4+3];
    __xlx_imag_sample_57__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_57 = 16;
  int __xlx_offset_param_imag_sample_57 = 0;
  int __xlx_offset_byte_param_imag_sample_57 = 0*4;
  int* __xlx_imag_sample_57__input_buffer= new int[__xlx_imag_sample_57__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_57__tmp_vec.size(); ++i) {
    __xlx_imag_sample_57__input_buffer[i] = __xlx_imag_sample_57__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_58__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_58__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_58)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_58)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_58)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_58)[j*4+3];
    __xlx_imag_sample_58__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_58 = 16;
  int __xlx_offset_param_imag_sample_58 = 0;
  int __xlx_offset_byte_param_imag_sample_58 = 0*4;
  int* __xlx_imag_sample_58__input_buffer= new int[__xlx_imag_sample_58__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_58__tmp_vec.size(); ++i) {
    __xlx_imag_sample_58__input_buffer[i] = __xlx_imag_sample_58__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_59__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_59__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_59)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_59)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_59)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_59)[j*4+3];
    __xlx_imag_sample_59__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_59 = 16;
  int __xlx_offset_param_imag_sample_59 = 0;
  int __xlx_offset_byte_param_imag_sample_59 = 0*4;
  int* __xlx_imag_sample_59__input_buffer= new int[__xlx_imag_sample_59__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_59__tmp_vec.size(); ++i) {
    __xlx_imag_sample_59__input_buffer[i] = __xlx_imag_sample_59__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_60__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_60__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_60)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_60)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_60)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_60)[j*4+3];
    __xlx_imag_sample_60__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_60 = 16;
  int __xlx_offset_param_imag_sample_60 = 0;
  int __xlx_offset_byte_param_imag_sample_60 = 0*4;
  int* __xlx_imag_sample_60__input_buffer= new int[__xlx_imag_sample_60__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_60__tmp_vec.size(); ++i) {
    __xlx_imag_sample_60__input_buffer[i] = __xlx_imag_sample_60__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_61__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_61__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_61)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_61)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_61)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_61)[j*4+3];
    __xlx_imag_sample_61__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_61 = 16;
  int __xlx_offset_param_imag_sample_61 = 0;
  int __xlx_offset_byte_param_imag_sample_61 = 0*4;
  int* __xlx_imag_sample_61__input_buffer= new int[__xlx_imag_sample_61__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_61__tmp_vec.size(); ++i) {
    __xlx_imag_sample_61__input_buffer[i] = __xlx_imag_sample_61__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_62__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_62__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_62)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_62)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_62)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_62)[j*4+3];
    __xlx_imag_sample_62__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_62 = 16;
  int __xlx_offset_param_imag_sample_62 = 0;
  int __xlx_offset_byte_param_imag_sample_62 = 0*4;
  int* __xlx_imag_sample_62__input_buffer= new int[__xlx_imag_sample_62__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_62__tmp_vec.size(); ++i) {
    __xlx_imag_sample_62__input_buffer[i] = __xlx_imag_sample_62__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_sample_63__tmp_vec
  vector<sc_bv<32> >__xlx_imag_sample_63__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_sample_63)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_sample_63)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_sample_63)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_sample_63)[j*4+3];
    __xlx_imag_sample_63__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_sample_63 = 16;
  int __xlx_offset_param_imag_sample_63 = 0;
  int __xlx_offset_byte_param_imag_sample_63 = 0*4;
  int* __xlx_imag_sample_63__input_buffer= new int[__xlx_imag_sample_63__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_sample_63__tmp_vec.size(); ++i) {
    __xlx_imag_sample_63__input_buffer[i] = __xlx_imag_sample_63__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_0__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_0__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_0)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_0)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_0)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_0)[j*4+3];
    __xlx_real_output_0__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_0 = 16;
  int __xlx_offset_param_real_output_0 = 0;
  int __xlx_offset_byte_param_real_output_0 = 0*4;
  int* __xlx_real_output_0__input_buffer= new int[__xlx_real_output_0__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_0__tmp_vec.size(); ++i) {
    __xlx_real_output_0__input_buffer[i] = __xlx_real_output_0__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_1__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_1__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_1)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_1)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_1)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_1)[j*4+3];
    __xlx_real_output_1__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_1 = 16;
  int __xlx_offset_param_real_output_1 = 0;
  int __xlx_offset_byte_param_real_output_1 = 0*4;
  int* __xlx_real_output_1__input_buffer= new int[__xlx_real_output_1__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_1__tmp_vec.size(); ++i) {
    __xlx_real_output_1__input_buffer[i] = __xlx_real_output_1__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_2__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_2__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_2)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_2)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_2)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_2)[j*4+3];
    __xlx_real_output_2__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_2 = 16;
  int __xlx_offset_param_real_output_2 = 0;
  int __xlx_offset_byte_param_real_output_2 = 0*4;
  int* __xlx_real_output_2__input_buffer= new int[__xlx_real_output_2__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_2__tmp_vec.size(); ++i) {
    __xlx_real_output_2__input_buffer[i] = __xlx_real_output_2__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_3__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_3__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_3)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_3)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_3)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_3)[j*4+3];
    __xlx_real_output_3__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_3 = 16;
  int __xlx_offset_param_real_output_3 = 0;
  int __xlx_offset_byte_param_real_output_3 = 0*4;
  int* __xlx_real_output_3__input_buffer= new int[__xlx_real_output_3__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_3__tmp_vec.size(); ++i) {
    __xlx_real_output_3__input_buffer[i] = __xlx_real_output_3__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_4__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_4__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_4)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_4)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_4)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_4)[j*4+3];
    __xlx_real_output_4__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_4 = 16;
  int __xlx_offset_param_real_output_4 = 0;
  int __xlx_offset_byte_param_real_output_4 = 0*4;
  int* __xlx_real_output_4__input_buffer= new int[__xlx_real_output_4__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_4__tmp_vec.size(); ++i) {
    __xlx_real_output_4__input_buffer[i] = __xlx_real_output_4__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_5__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_5__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_5)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_5)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_5)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_5)[j*4+3];
    __xlx_real_output_5__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_5 = 16;
  int __xlx_offset_param_real_output_5 = 0;
  int __xlx_offset_byte_param_real_output_5 = 0*4;
  int* __xlx_real_output_5__input_buffer= new int[__xlx_real_output_5__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_5__tmp_vec.size(); ++i) {
    __xlx_real_output_5__input_buffer[i] = __xlx_real_output_5__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_6__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_6__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_6)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_6)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_6)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_6)[j*4+3];
    __xlx_real_output_6__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_6 = 16;
  int __xlx_offset_param_real_output_6 = 0;
  int __xlx_offset_byte_param_real_output_6 = 0*4;
  int* __xlx_real_output_6__input_buffer= new int[__xlx_real_output_6__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_6__tmp_vec.size(); ++i) {
    __xlx_real_output_6__input_buffer[i] = __xlx_real_output_6__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_7__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_7__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_7)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_7)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_7)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_7)[j*4+3];
    __xlx_real_output_7__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_7 = 16;
  int __xlx_offset_param_real_output_7 = 0;
  int __xlx_offset_byte_param_real_output_7 = 0*4;
  int* __xlx_real_output_7__input_buffer= new int[__xlx_real_output_7__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_7__tmp_vec.size(); ++i) {
    __xlx_real_output_7__input_buffer[i] = __xlx_real_output_7__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_8__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_8__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_8)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_8)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_8)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_8)[j*4+3];
    __xlx_real_output_8__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_8 = 16;
  int __xlx_offset_param_real_output_8 = 0;
  int __xlx_offset_byte_param_real_output_8 = 0*4;
  int* __xlx_real_output_8__input_buffer= new int[__xlx_real_output_8__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_8__tmp_vec.size(); ++i) {
    __xlx_real_output_8__input_buffer[i] = __xlx_real_output_8__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_9__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_9__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_9)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_9)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_9)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_9)[j*4+3];
    __xlx_real_output_9__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_9 = 16;
  int __xlx_offset_param_real_output_9 = 0;
  int __xlx_offset_byte_param_real_output_9 = 0*4;
  int* __xlx_real_output_9__input_buffer= new int[__xlx_real_output_9__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_9__tmp_vec.size(); ++i) {
    __xlx_real_output_9__input_buffer[i] = __xlx_real_output_9__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_10__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_10__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_10)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_10)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_10)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_10)[j*4+3];
    __xlx_real_output_10__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_10 = 16;
  int __xlx_offset_param_real_output_10 = 0;
  int __xlx_offset_byte_param_real_output_10 = 0*4;
  int* __xlx_real_output_10__input_buffer= new int[__xlx_real_output_10__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_10__tmp_vec.size(); ++i) {
    __xlx_real_output_10__input_buffer[i] = __xlx_real_output_10__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_11__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_11__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_11)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_11)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_11)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_11)[j*4+3];
    __xlx_real_output_11__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_11 = 16;
  int __xlx_offset_param_real_output_11 = 0;
  int __xlx_offset_byte_param_real_output_11 = 0*4;
  int* __xlx_real_output_11__input_buffer= new int[__xlx_real_output_11__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_11__tmp_vec.size(); ++i) {
    __xlx_real_output_11__input_buffer[i] = __xlx_real_output_11__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_12__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_12__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_12)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_12)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_12)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_12)[j*4+3];
    __xlx_real_output_12__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_12 = 16;
  int __xlx_offset_param_real_output_12 = 0;
  int __xlx_offset_byte_param_real_output_12 = 0*4;
  int* __xlx_real_output_12__input_buffer= new int[__xlx_real_output_12__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_12__tmp_vec.size(); ++i) {
    __xlx_real_output_12__input_buffer[i] = __xlx_real_output_12__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_13__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_13__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_13)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_13)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_13)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_13)[j*4+3];
    __xlx_real_output_13__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_13 = 16;
  int __xlx_offset_param_real_output_13 = 0;
  int __xlx_offset_byte_param_real_output_13 = 0*4;
  int* __xlx_real_output_13__input_buffer= new int[__xlx_real_output_13__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_13__tmp_vec.size(); ++i) {
    __xlx_real_output_13__input_buffer[i] = __xlx_real_output_13__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_14__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_14__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_14)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_14)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_14)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_14)[j*4+3];
    __xlx_real_output_14__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_14 = 16;
  int __xlx_offset_param_real_output_14 = 0;
  int __xlx_offset_byte_param_real_output_14 = 0*4;
  int* __xlx_real_output_14__input_buffer= new int[__xlx_real_output_14__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_14__tmp_vec.size(); ++i) {
    __xlx_real_output_14__input_buffer[i] = __xlx_real_output_14__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_15__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_15__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_15)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_15)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_15)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_15)[j*4+3];
    __xlx_real_output_15__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_15 = 16;
  int __xlx_offset_param_real_output_15 = 0;
  int __xlx_offset_byte_param_real_output_15 = 0*4;
  int* __xlx_real_output_15__input_buffer= new int[__xlx_real_output_15__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_15__tmp_vec.size(); ++i) {
    __xlx_real_output_15__input_buffer[i] = __xlx_real_output_15__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_16__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_16__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_16)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_16)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_16)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_16)[j*4+3];
    __xlx_real_output_16__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_16 = 16;
  int __xlx_offset_param_real_output_16 = 0;
  int __xlx_offset_byte_param_real_output_16 = 0*4;
  int* __xlx_real_output_16__input_buffer= new int[__xlx_real_output_16__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_16__tmp_vec.size(); ++i) {
    __xlx_real_output_16__input_buffer[i] = __xlx_real_output_16__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_17__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_17__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_17)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_17)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_17)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_17)[j*4+3];
    __xlx_real_output_17__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_17 = 16;
  int __xlx_offset_param_real_output_17 = 0;
  int __xlx_offset_byte_param_real_output_17 = 0*4;
  int* __xlx_real_output_17__input_buffer= new int[__xlx_real_output_17__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_17__tmp_vec.size(); ++i) {
    __xlx_real_output_17__input_buffer[i] = __xlx_real_output_17__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_18__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_18__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_18)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_18)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_18)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_18)[j*4+3];
    __xlx_real_output_18__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_18 = 16;
  int __xlx_offset_param_real_output_18 = 0;
  int __xlx_offset_byte_param_real_output_18 = 0*4;
  int* __xlx_real_output_18__input_buffer= new int[__xlx_real_output_18__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_18__tmp_vec.size(); ++i) {
    __xlx_real_output_18__input_buffer[i] = __xlx_real_output_18__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_19__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_19__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_19)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_19)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_19)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_19)[j*4+3];
    __xlx_real_output_19__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_19 = 16;
  int __xlx_offset_param_real_output_19 = 0;
  int __xlx_offset_byte_param_real_output_19 = 0*4;
  int* __xlx_real_output_19__input_buffer= new int[__xlx_real_output_19__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_19__tmp_vec.size(); ++i) {
    __xlx_real_output_19__input_buffer[i] = __xlx_real_output_19__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_20__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_20__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_20)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_20)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_20)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_20)[j*4+3];
    __xlx_real_output_20__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_20 = 16;
  int __xlx_offset_param_real_output_20 = 0;
  int __xlx_offset_byte_param_real_output_20 = 0*4;
  int* __xlx_real_output_20__input_buffer= new int[__xlx_real_output_20__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_20__tmp_vec.size(); ++i) {
    __xlx_real_output_20__input_buffer[i] = __xlx_real_output_20__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_21__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_21__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_21)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_21)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_21)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_21)[j*4+3];
    __xlx_real_output_21__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_21 = 16;
  int __xlx_offset_param_real_output_21 = 0;
  int __xlx_offset_byte_param_real_output_21 = 0*4;
  int* __xlx_real_output_21__input_buffer= new int[__xlx_real_output_21__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_21__tmp_vec.size(); ++i) {
    __xlx_real_output_21__input_buffer[i] = __xlx_real_output_21__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_22__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_22__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_22)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_22)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_22)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_22)[j*4+3];
    __xlx_real_output_22__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_22 = 16;
  int __xlx_offset_param_real_output_22 = 0;
  int __xlx_offset_byte_param_real_output_22 = 0*4;
  int* __xlx_real_output_22__input_buffer= new int[__xlx_real_output_22__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_22__tmp_vec.size(); ++i) {
    __xlx_real_output_22__input_buffer[i] = __xlx_real_output_22__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_23__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_23__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_23)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_23)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_23)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_23)[j*4+3];
    __xlx_real_output_23__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_23 = 16;
  int __xlx_offset_param_real_output_23 = 0;
  int __xlx_offset_byte_param_real_output_23 = 0*4;
  int* __xlx_real_output_23__input_buffer= new int[__xlx_real_output_23__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_23__tmp_vec.size(); ++i) {
    __xlx_real_output_23__input_buffer[i] = __xlx_real_output_23__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_24__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_24__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_24)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_24)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_24)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_24)[j*4+3];
    __xlx_real_output_24__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_24 = 16;
  int __xlx_offset_param_real_output_24 = 0;
  int __xlx_offset_byte_param_real_output_24 = 0*4;
  int* __xlx_real_output_24__input_buffer= new int[__xlx_real_output_24__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_24__tmp_vec.size(); ++i) {
    __xlx_real_output_24__input_buffer[i] = __xlx_real_output_24__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_25__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_25__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_25)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_25)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_25)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_25)[j*4+3];
    __xlx_real_output_25__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_25 = 16;
  int __xlx_offset_param_real_output_25 = 0;
  int __xlx_offset_byte_param_real_output_25 = 0*4;
  int* __xlx_real_output_25__input_buffer= new int[__xlx_real_output_25__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_25__tmp_vec.size(); ++i) {
    __xlx_real_output_25__input_buffer[i] = __xlx_real_output_25__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_26__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_26__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_26)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_26)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_26)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_26)[j*4+3];
    __xlx_real_output_26__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_26 = 16;
  int __xlx_offset_param_real_output_26 = 0;
  int __xlx_offset_byte_param_real_output_26 = 0*4;
  int* __xlx_real_output_26__input_buffer= new int[__xlx_real_output_26__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_26__tmp_vec.size(); ++i) {
    __xlx_real_output_26__input_buffer[i] = __xlx_real_output_26__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_27__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_27__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_27)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_27)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_27)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_27)[j*4+3];
    __xlx_real_output_27__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_27 = 16;
  int __xlx_offset_param_real_output_27 = 0;
  int __xlx_offset_byte_param_real_output_27 = 0*4;
  int* __xlx_real_output_27__input_buffer= new int[__xlx_real_output_27__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_27__tmp_vec.size(); ++i) {
    __xlx_real_output_27__input_buffer[i] = __xlx_real_output_27__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_28__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_28__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_28)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_28)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_28)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_28)[j*4+3];
    __xlx_real_output_28__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_28 = 16;
  int __xlx_offset_param_real_output_28 = 0;
  int __xlx_offset_byte_param_real_output_28 = 0*4;
  int* __xlx_real_output_28__input_buffer= new int[__xlx_real_output_28__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_28__tmp_vec.size(); ++i) {
    __xlx_real_output_28__input_buffer[i] = __xlx_real_output_28__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_29__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_29__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_29)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_29)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_29)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_29)[j*4+3];
    __xlx_real_output_29__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_29 = 16;
  int __xlx_offset_param_real_output_29 = 0;
  int __xlx_offset_byte_param_real_output_29 = 0*4;
  int* __xlx_real_output_29__input_buffer= new int[__xlx_real_output_29__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_29__tmp_vec.size(); ++i) {
    __xlx_real_output_29__input_buffer[i] = __xlx_real_output_29__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_30__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_30__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_30)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_30)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_30)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_30)[j*4+3];
    __xlx_real_output_30__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_30 = 16;
  int __xlx_offset_param_real_output_30 = 0;
  int __xlx_offset_byte_param_real_output_30 = 0*4;
  int* __xlx_real_output_30__input_buffer= new int[__xlx_real_output_30__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_30__tmp_vec.size(); ++i) {
    __xlx_real_output_30__input_buffer[i] = __xlx_real_output_30__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_31__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_31__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_31)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_31)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_31)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_31)[j*4+3];
    __xlx_real_output_31__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_31 = 16;
  int __xlx_offset_param_real_output_31 = 0;
  int __xlx_offset_byte_param_real_output_31 = 0*4;
  int* __xlx_real_output_31__input_buffer= new int[__xlx_real_output_31__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_31__tmp_vec.size(); ++i) {
    __xlx_real_output_31__input_buffer[i] = __xlx_real_output_31__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_32__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_32__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_32)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_32)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_32)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_32)[j*4+3];
    __xlx_real_output_32__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_32 = 16;
  int __xlx_offset_param_real_output_32 = 0;
  int __xlx_offset_byte_param_real_output_32 = 0*4;
  int* __xlx_real_output_32__input_buffer= new int[__xlx_real_output_32__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_32__tmp_vec.size(); ++i) {
    __xlx_real_output_32__input_buffer[i] = __xlx_real_output_32__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_33__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_33__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_33)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_33)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_33)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_33)[j*4+3];
    __xlx_real_output_33__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_33 = 16;
  int __xlx_offset_param_real_output_33 = 0;
  int __xlx_offset_byte_param_real_output_33 = 0*4;
  int* __xlx_real_output_33__input_buffer= new int[__xlx_real_output_33__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_33__tmp_vec.size(); ++i) {
    __xlx_real_output_33__input_buffer[i] = __xlx_real_output_33__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_34__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_34__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_34)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_34)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_34)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_34)[j*4+3];
    __xlx_real_output_34__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_34 = 16;
  int __xlx_offset_param_real_output_34 = 0;
  int __xlx_offset_byte_param_real_output_34 = 0*4;
  int* __xlx_real_output_34__input_buffer= new int[__xlx_real_output_34__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_34__tmp_vec.size(); ++i) {
    __xlx_real_output_34__input_buffer[i] = __xlx_real_output_34__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_35__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_35__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_35)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_35)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_35)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_35)[j*4+3];
    __xlx_real_output_35__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_35 = 16;
  int __xlx_offset_param_real_output_35 = 0;
  int __xlx_offset_byte_param_real_output_35 = 0*4;
  int* __xlx_real_output_35__input_buffer= new int[__xlx_real_output_35__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_35__tmp_vec.size(); ++i) {
    __xlx_real_output_35__input_buffer[i] = __xlx_real_output_35__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_36__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_36__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_36)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_36)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_36)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_36)[j*4+3];
    __xlx_real_output_36__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_36 = 16;
  int __xlx_offset_param_real_output_36 = 0;
  int __xlx_offset_byte_param_real_output_36 = 0*4;
  int* __xlx_real_output_36__input_buffer= new int[__xlx_real_output_36__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_36__tmp_vec.size(); ++i) {
    __xlx_real_output_36__input_buffer[i] = __xlx_real_output_36__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_37__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_37__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_37)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_37)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_37)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_37)[j*4+3];
    __xlx_real_output_37__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_37 = 16;
  int __xlx_offset_param_real_output_37 = 0;
  int __xlx_offset_byte_param_real_output_37 = 0*4;
  int* __xlx_real_output_37__input_buffer= new int[__xlx_real_output_37__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_37__tmp_vec.size(); ++i) {
    __xlx_real_output_37__input_buffer[i] = __xlx_real_output_37__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_38__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_38__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_38)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_38)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_38)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_38)[j*4+3];
    __xlx_real_output_38__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_38 = 16;
  int __xlx_offset_param_real_output_38 = 0;
  int __xlx_offset_byte_param_real_output_38 = 0*4;
  int* __xlx_real_output_38__input_buffer= new int[__xlx_real_output_38__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_38__tmp_vec.size(); ++i) {
    __xlx_real_output_38__input_buffer[i] = __xlx_real_output_38__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_39__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_39__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_39)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_39)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_39)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_39)[j*4+3];
    __xlx_real_output_39__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_39 = 16;
  int __xlx_offset_param_real_output_39 = 0;
  int __xlx_offset_byte_param_real_output_39 = 0*4;
  int* __xlx_real_output_39__input_buffer= new int[__xlx_real_output_39__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_39__tmp_vec.size(); ++i) {
    __xlx_real_output_39__input_buffer[i] = __xlx_real_output_39__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_40__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_40__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_40)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_40)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_40)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_40)[j*4+3];
    __xlx_real_output_40__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_40 = 16;
  int __xlx_offset_param_real_output_40 = 0;
  int __xlx_offset_byte_param_real_output_40 = 0*4;
  int* __xlx_real_output_40__input_buffer= new int[__xlx_real_output_40__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_40__tmp_vec.size(); ++i) {
    __xlx_real_output_40__input_buffer[i] = __xlx_real_output_40__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_41__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_41__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_41)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_41)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_41)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_41)[j*4+3];
    __xlx_real_output_41__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_41 = 16;
  int __xlx_offset_param_real_output_41 = 0;
  int __xlx_offset_byte_param_real_output_41 = 0*4;
  int* __xlx_real_output_41__input_buffer= new int[__xlx_real_output_41__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_41__tmp_vec.size(); ++i) {
    __xlx_real_output_41__input_buffer[i] = __xlx_real_output_41__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_42__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_42__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_42)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_42)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_42)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_42)[j*4+3];
    __xlx_real_output_42__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_42 = 16;
  int __xlx_offset_param_real_output_42 = 0;
  int __xlx_offset_byte_param_real_output_42 = 0*4;
  int* __xlx_real_output_42__input_buffer= new int[__xlx_real_output_42__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_42__tmp_vec.size(); ++i) {
    __xlx_real_output_42__input_buffer[i] = __xlx_real_output_42__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_43__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_43__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_43)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_43)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_43)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_43)[j*4+3];
    __xlx_real_output_43__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_43 = 16;
  int __xlx_offset_param_real_output_43 = 0;
  int __xlx_offset_byte_param_real_output_43 = 0*4;
  int* __xlx_real_output_43__input_buffer= new int[__xlx_real_output_43__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_43__tmp_vec.size(); ++i) {
    __xlx_real_output_43__input_buffer[i] = __xlx_real_output_43__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_44__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_44__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_44)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_44)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_44)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_44)[j*4+3];
    __xlx_real_output_44__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_44 = 16;
  int __xlx_offset_param_real_output_44 = 0;
  int __xlx_offset_byte_param_real_output_44 = 0*4;
  int* __xlx_real_output_44__input_buffer= new int[__xlx_real_output_44__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_44__tmp_vec.size(); ++i) {
    __xlx_real_output_44__input_buffer[i] = __xlx_real_output_44__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_45__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_45__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_45)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_45)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_45)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_45)[j*4+3];
    __xlx_real_output_45__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_45 = 16;
  int __xlx_offset_param_real_output_45 = 0;
  int __xlx_offset_byte_param_real_output_45 = 0*4;
  int* __xlx_real_output_45__input_buffer= new int[__xlx_real_output_45__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_45__tmp_vec.size(); ++i) {
    __xlx_real_output_45__input_buffer[i] = __xlx_real_output_45__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_46__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_46__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_46)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_46)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_46)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_46)[j*4+3];
    __xlx_real_output_46__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_46 = 16;
  int __xlx_offset_param_real_output_46 = 0;
  int __xlx_offset_byte_param_real_output_46 = 0*4;
  int* __xlx_real_output_46__input_buffer= new int[__xlx_real_output_46__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_46__tmp_vec.size(); ++i) {
    __xlx_real_output_46__input_buffer[i] = __xlx_real_output_46__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_47__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_47__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_47)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_47)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_47)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_47)[j*4+3];
    __xlx_real_output_47__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_47 = 16;
  int __xlx_offset_param_real_output_47 = 0;
  int __xlx_offset_byte_param_real_output_47 = 0*4;
  int* __xlx_real_output_47__input_buffer= new int[__xlx_real_output_47__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_47__tmp_vec.size(); ++i) {
    __xlx_real_output_47__input_buffer[i] = __xlx_real_output_47__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_48__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_48__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_48)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_48)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_48)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_48)[j*4+3];
    __xlx_real_output_48__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_48 = 16;
  int __xlx_offset_param_real_output_48 = 0;
  int __xlx_offset_byte_param_real_output_48 = 0*4;
  int* __xlx_real_output_48__input_buffer= new int[__xlx_real_output_48__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_48__tmp_vec.size(); ++i) {
    __xlx_real_output_48__input_buffer[i] = __xlx_real_output_48__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_49__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_49__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_49)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_49)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_49)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_49)[j*4+3];
    __xlx_real_output_49__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_49 = 16;
  int __xlx_offset_param_real_output_49 = 0;
  int __xlx_offset_byte_param_real_output_49 = 0*4;
  int* __xlx_real_output_49__input_buffer= new int[__xlx_real_output_49__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_49__tmp_vec.size(); ++i) {
    __xlx_real_output_49__input_buffer[i] = __xlx_real_output_49__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_50__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_50__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_50)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_50)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_50)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_50)[j*4+3];
    __xlx_real_output_50__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_50 = 16;
  int __xlx_offset_param_real_output_50 = 0;
  int __xlx_offset_byte_param_real_output_50 = 0*4;
  int* __xlx_real_output_50__input_buffer= new int[__xlx_real_output_50__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_50__tmp_vec.size(); ++i) {
    __xlx_real_output_50__input_buffer[i] = __xlx_real_output_50__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_51__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_51__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_51)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_51)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_51)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_51)[j*4+3];
    __xlx_real_output_51__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_51 = 16;
  int __xlx_offset_param_real_output_51 = 0;
  int __xlx_offset_byte_param_real_output_51 = 0*4;
  int* __xlx_real_output_51__input_buffer= new int[__xlx_real_output_51__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_51__tmp_vec.size(); ++i) {
    __xlx_real_output_51__input_buffer[i] = __xlx_real_output_51__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_52__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_52__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_52)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_52)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_52)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_52)[j*4+3];
    __xlx_real_output_52__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_52 = 16;
  int __xlx_offset_param_real_output_52 = 0;
  int __xlx_offset_byte_param_real_output_52 = 0*4;
  int* __xlx_real_output_52__input_buffer= new int[__xlx_real_output_52__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_52__tmp_vec.size(); ++i) {
    __xlx_real_output_52__input_buffer[i] = __xlx_real_output_52__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_53__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_53__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_53)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_53)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_53)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_53)[j*4+3];
    __xlx_real_output_53__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_53 = 16;
  int __xlx_offset_param_real_output_53 = 0;
  int __xlx_offset_byte_param_real_output_53 = 0*4;
  int* __xlx_real_output_53__input_buffer= new int[__xlx_real_output_53__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_53__tmp_vec.size(); ++i) {
    __xlx_real_output_53__input_buffer[i] = __xlx_real_output_53__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_54__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_54__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_54)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_54)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_54)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_54)[j*4+3];
    __xlx_real_output_54__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_54 = 16;
  int __xlx_offset_param_real_output_54 = 0;
  int __xlx_offset_byte_param_real_output_54 = 0*4;
  int* __xlx_real_output_54__input_buffer= new int[__xlx_real_output_54__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_54__tmp_vec.size(); ++i) {
    __xlx_real_output_54__input_buffer[i] = __xlx_real_output_54__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_55__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_55__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_55)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_55)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_55)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_55)[j*4+3];
    __xlx_real_output_55__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_55 = 16;
  int __xlx_offset_param_real_output_55 = 0;
  int __xlx_offset_byte_param_real_output_55 = 0*4;
  int* __xlx_real_output_55__input_buffer= new int[__xlx_real_output_55__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_55__tmp_vec.size(); ++i) {
    __xlx_real_output_55__input_buffer[i] = __xlx_real_output_55__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_56__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_56__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_56)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_56)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_56)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_56)[j*4+3];
    __xlx_real_output_56__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_56 = 16;
  int __xlx_offset_param_real_output_56 = 0;
  int __xlx_offset_byte_param_real_output_56 = 0*4;
  int* __xlx_real_output_56__input_buffer= new int[__xlx_real_output_56__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_56__tmp_vec.size(); ++i) {
    __xlx_real_output_56__input_buffer[i] = __xlx_real_output_56__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_57__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_57__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_57)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_57)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_57)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_57)[j*4+3];
    __xlx_real_output_57__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_57 = 16;
  int __xlx_offset_param_real_output_57 = 0;
  int __xlx_offset_byte_param_real_output_57 = 0*4;
  int* __xlx_real_output_57__input_buffer= new int[__xlx_real_output_57__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_57__tmp_vec.size(); ++i) {
    __xlx_real_output_57__input_buffer[i] = __xlx_real_output_57__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_58__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_58__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_58)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_58)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_58)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_58)[j*4+3];
    __xlx_real_output_58__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_58 = 16;
  int __xlx_offset_param_real_output_58 = 0;
  int __xlx_offset_byte_param_real_output_58 = 0*4;
  int* __xlx_real_output_58__input_buffer= new int[__xlx_real_output_58__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_58__tmp_vec.size(); ++i) {
    __xlx_real_output_58__input_buffer[i] = __xlx_real_output_58__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_59__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_59__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_59)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_59)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_59)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_59)[j*4+3];
    __xlx_real_output_59__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_59 = 16;
  int __xlx_offset_param_real_output_59 = 0;
  int __xlx_offset_byte_param_real_output_59 = 0*4;
  int* __xlx_real_output_59__input_buffer= new int[__xlx_real_output_59__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_59__tmp_vec.size(); ++i) {
    __xlx_real_output_59__input_buffer[i] = __xlx_real_output_59__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_60__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_60__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_60)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_60)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_60)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_60)[j*4+3];
    __xlx_real_output_60__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_60 = 16;
  int __xlx_offset_param_real_output_60 = 0;
  int __xlx_offset_byte_param_real_output_60 = 0*4;
  int* __xlx_real_output_60__input_buffer= new int[__xlx_real_output_60__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_60__tmp_vec.size(); ++i) {
    __xlx_real_output_60__input_buffer[i] = __xlx_real_output_60__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_61__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_61__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_61)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_61)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_61)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_61)[j*4+3];
    __xlx_real_output_61__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_61 = 16;
  int __xlx_offset_param_real_output_61 = 0;
  int __xlx_offset_byte_param_real_output_61 = 0*4;
  int* __xlx_real_output_61__input_buffer= new int[__xlx_real_output_61__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_61__tmp_vec.size(); ++i) {
    __xlx_real_output_61__input_buffer[i] = __xlx_real_output_61__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_62__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_62__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_62)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_62)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_62)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_62)[j*4+3];
    __xlx_real_output_62__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_62 = 16;
  int __xlx_offset_param_real_output_62 = 0;
  int __xlx_offset_byte_param_real_output_62 = 0*4;
  int* __xlx_real_output_62__input_buffer= new int[__xlx_real_output_62__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_62__tmp_vec.size(); ++i) {
    __xlx_real_output_62__input_buffer[i] = __xlx_real_output_62__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_real_output_63__tmp_vec
  vector<sc_bv<32> >__xlx_real_output_63__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_real_output_63)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_real_output_63)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_real_output_63)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_real_output_63)[j*4+3];
    __xlx_real_output_63__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_real_output_63 = 16;
  int __xlx_offset_param_real_output_63 = 0;
  int __xlx_offset_byte_param_real_output_63 = 0*4;
  int* __xlx_real_output_63__input_buffer= new int[__xlx_real_output_63__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_output_63__tmp_vec.size(); ++i) {
    __xlx_real_output_63__input_buffer[i] = __xlx_real_output_63__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_0__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_0__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_0)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_0)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_0)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_0)[j*4+3];
    __xlx_imag_output_0__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_0 = 16;
  int __xlx_offset_param_imag_output_0 = 0;
  int __xlx_offset_byte_param_imag_output_0 = 0*4;
  int* __xlx_imag_output_0__input_buffer= new int[__xlx_imag_output_0__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_0__tmp_vec.size(); ++i) {
    __xlx_imag_output_0__input_buffer[i] = __xlx_imag_output_0__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_1__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_1__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_1)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_1)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_1)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_1)[j*4+3];
    __xlx_imag_output_1__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_1 = 16;
  int __xlx_offset_param_imag_output_1 = 0;
  int __xlx_offset_byte_param_imag_output_1 = 0*4;
  int* __xlx_imag_output_1__input_buffer= new int[__xlx_imag_output_1__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_1__tmp_vec.size(); ++i) {
    __xlx_imag_output_1__input_buffer[i] = __xlx_imag_output_1__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_2__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_2__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_2)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_2)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_2)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_2)[j*4+3];
    __xlx_imag_output_2__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_2 = 16;
  int __xlx_offset_param_imag_output_2 = 0;
  int __xlx_offset_byte_param_imag_output_2 = 0*4;
  int* __xlx_imag_output_2__input_buffer= new int[__xlx_imag_output_2__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_2__tmp_vec.size(); ++i) {
    __xlx_imag_output_2__input_buffer[i] = __xlx_imag_output_2__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_3__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_3__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_3)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_3)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_3)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_3)[j*4+3];
    __xlx_imag_output_3__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_3 = 16;
  int __xlx_offset_param_imag_output_3 = 0;
  int __xlx_offset_byte_param_imag_output_3 = 0*4;
  int* __xlx_imag_output_3__input_buffer= new int[__xlx_imag_output_3__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_3__tmp_vec.size(); ++i) {
    __xlx_imag_output_3__input_buffer[i] = __xlx_imag_output_3__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_4__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_4__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_4)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_4)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_4)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_4)[j*4+3];
    __xlx_imag_output_4__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_4 = 16;
  int __xlx_offset_param_imag_output_4 = 0;
  int __xlx_offset_byte_param_imag_output_4 = 0*4;
  int* __xlx_imag_output_4__input_buffer= new int[__xlx_imag_output_4__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_4__tmp_vec.size(); ++i) {
    __xlx_imag_output_4__input_buffer[i] = __xlx_imag_output_4__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_5__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_5__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_5)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_5)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_5)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_5)[j*4+3];
    __xlx_imag_output_5__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_5 = 16;
  int __xlx_offset_param_imag_output_5 = 0;
  int __xlx_offset_byte_param_imag_output_5 = 0*4;
  int* __xlx_imag_output_5__input_buffer= new int[__xlx_imag_output_5__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_5__tmp_vec.size(); ++i) {
    __xlx_imag_output_5__input_buffer[i] = __xlx_imag_output_5__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_6__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_6__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_6)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_6)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_6)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_6)[j*4+3];
    __xlx_imag_output_6__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_6 = 16;
  int __xlx_offset_param_imag_output_6 = 0;
  int __xlx_offset_byte_param_imag_output_6 = 0*4;
  int* __xlx_imag_output_6__input_buffer= new int[__xlx_imag_output_6__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_6__tmp_vec.size(); ++i) {
    __xlx_imag_output_6__input_buffer[i] = __xlx_imag_output_6__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_7__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_7__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_7)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_7)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_7)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_7)[j*4+3];
    __xlx_imag_output_7__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_7 = 16;
  int __xlx_offset_param_imag_output_7 = 0;
  int __xlx_offset_byte_param_imag_output_7 = 0*4;
  int* __xlx_imag_output_7__input_buffer= new int[__xlx_imag_output_7__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_7__tmp_vec.size(); ++i) {
    __xlx_imag_output_7__input_buffer[i] = __xlx_imag_output_7__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_8__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_8__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_8)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_8)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_8)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_8)[j*4+3];
    __xlx_imag_output_8__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_8 = 16;
  int __xlx_offset_param_imag_output_8 = 0;
  int __xlx_offset_byte_param_imag_output_8 = 0*4;
  int* __xlx_imag_output_8__input_buffer= new int[__xlx_imag_output_8__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_8__tmp_vec.size(); ++i) {
    __xlx_imag_output_8__input_buffer[i] = __xlx_imag_output_8__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_9__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_9__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_9)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_9)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_9)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_9)[j*4+3];
    __xlx_imag_output_9__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_9 = 16;
  int __xlx_offset_param_imag_output_9 = 0;
  int __xlx_offset_byte_param_imag_output_9 = 0*4;
  int* __xlx_imag_output_9__input_buffer= new int[__xlx_imag_output_9__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_9__tmp_vec.size(); ++i) {
    __xlx_imag_output_9__input_buffer[i] = __xlx_imag_output_9__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_10__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_10__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_10)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_10)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_10)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_10)[j*4+3];
    __xlx_imag_output_10__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_10 = 16;
  int __xlx_offset_param_imag_output_10 = 0;
  int __xlx_offset_byte_param_imag_output_10 = 0*4;
  int* __xlx_imag_output_10__input_buffer= new int[__xlx_imag_output_10__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_10__tmp_vec.size(); ++i) {
    __xlx_imag_output_10__input_buffer[i] = __xlx_imag_output_10__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_11__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_11__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_11)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_11)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_11)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_11)[j*4+3];
    __xlx_imag_output_11__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_11 = 16;
  int __xlx_offset_param_imag_output_11 = 0;
  int __xlx_offset_byte_param_imag_output_11 = 0*4;
  int* __xlx_imag_output_11__input_buffer= new int[__xlx_imag_output_11__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_11__tmp_vec.size(); ++i) {
    __xlx_imag_output_11__input_buffer[i] = __xlx_imag_output_11__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_12__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_12__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_12)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_12)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_12)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_12)[j*4+3];
    __xlx_imag_output_12__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_12 = 16;
  int __xlx_offset_param_imag_output_12 = 0;
  int __xlx_offset_byte_param_imag_output_12 = 0*4;
  int* __xlx_imag_output_12__input_buffer= new int[__xlx_imag_output_12__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_12__tmp_vec.size(); ++i) {
    __xlx_imag_output_12__input_buffer[i] = __xlx_imag_output_12__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_13__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_13__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_13)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_13)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_13)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_13)[j*4+3];
    __xlx_imag_output_13__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_13 = 16;
  int __xlx_offset_param_imag_output_13 = 0;
  int __xlx_offset_byte_param_imag_output_13 = 0*4;
  int* __xlx_imag_output_13__input_buffer= new int[__xlx_imag_output_13__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_13__tmp_vec.size(); ++i) {
    __xlx_imag_output_13__input_buffer[i] = __xlx_imag_output_13__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_14__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_14__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_14)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_14)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_14)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_14)[j*4+3];
    __xlx_imag_output_14__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_14 = 16;
  int __xlx_offset_param_imag_output_14 = 0;
  int __xlx_offset_byte_param_imag_output_14 = 0*4;
  int* __xlx_imag_output_14__input_buffer= new int[__xlx_imag_output_14__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_14__tmp_vec.size(); ++i) {
    __xlx_imag_output_14__input_buffer[i] = __xlx_imag_output_14__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_15__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_15__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_15)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_15)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_15)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_15)[j*4+3];
    __xlx_imag_output_15__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_15 = 16;
  int __xlx_offset_param_imag_output_15 = 0;
  int __xlx_offset_byte_param_imag_output_15 = 0*4;
  int* __xlx_imag_output_15__input_buffer= new int[__xlx_imag_output_15__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_15__tmp_vec.size(); ++i) {
    __xlx_imag_output_15__input_buffer[i] = __xlx_imag_output_15__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_16__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_16__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_16)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_16)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_16)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_16)[j*4+3];
    __xlx_imag_output_16__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_16 = 16;
  int __xlx_offset_param_imag_output_16 = 0;
  int __xlx_offset_byte_param_imag_output_16 = 0*4;
  int* __xlx_imag_output_16__input_buffer= new int[__xlx_imag_output_16__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_16__tmp_vec.size(); ++i) {
    __xlx_imag_output_16__input_buffer[i] = __xlx_imag_output_16__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_17__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_17__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_17)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_17)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_17)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_17)[j*4+3];
    __xlx_imag_output_17__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_17 = 16;
  int __xlx_offset_param_imag_output_17 = 0;
  int __xlx_offset_byte_param_imag_output_17 = 0*4;
  int* __xlx_imag_output_17__input_buffer= new int[__xlx_imag_output_17__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_17__tmp_vec.size(); ++i) {
    __xlx_imag_output_17__input_buffer[i] = __xlx_imag_output_17__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_18__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_18__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_18)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_18)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_18)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_18)[j*4+3];
    __xlx_imag_output_18__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_18 = 16;
  int __xlx_offset_param_imag_output_18 = 0;
  int __xlx_offset_byte_param_imag_output_18 = 0*4;
  int* __xlx_imag_output_18__input_buffer= new int[__xlx_imag_output_18__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_18__tmp_vec.size(); ++i) {
    __xlx_imag_output_18__input_buffer[i] = __xlx_imag_output_18__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_19__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_19__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_19)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_19)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_19)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_19)[j*4+3];
    __xlx_imag_output_19__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_19 = 16;
  int __xlx_offset_param_imag_output_19 = 0;
  int __xlx_offset_byte_param_imag_output_19 = 0*4;
  int* __xlx_imag_output_19__input_buffer= new int[__xlx_imag_output_19__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_19__tmp_vec.size(); ++i) {
    __xlx_imag_output_19__input_buffer[i] = __xlx_imag_output_19__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_20__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_20__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_20)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_20)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_20)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_20)[j*4+3];
    __xlx_imag_output_20__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_20 = 16;
  int __xlx_offset_param_imag_output_20 = 0;
  int __xlx_offset_byte_param_imag_output_20 = 0*4;
  int* __xlx_imag_output_20__input_buffer= new int[__xlx_imag_output_20__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_20__tmp_vec.size(); ++i) {
    __xlx_imag_output_20__input_buffer[i] = __xlx_imag_output_20__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_21__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_21__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_21)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_21)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_21)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_21)[j*4+3];
    __xlx_imag_output_21__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_21 = 16;
  int __xlx_offset_param_imag_output_21 = 0;
  int __xlx_offset_byte_param_imag_output_21 = 0*4;
  int* __xlx_imag_output_21__input_buffer= new int[__xlx_imag_output_21__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_21__tmp_vec.size(); ++i) {
    __xlx_imag_output_21__input_buffer[i] = __xlx_imag_output_21__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_22__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_22__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_22)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_22)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_22)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_22)[j*4+3];
    __xlx_imag_output_22__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_22 = 16;
  int __xlx_offset_param_imag_output_22 = 0;
  int __xlx_offset_byte_param_imag_output_22 = 0*4;
  int* __xlx_imag_output_22__input_buffer= new int[__xlx_imag_output_22__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_22__tmp_vec.size(); ++i) {
    __xlx_imag_output_22__input_buffer[i] = __xlx_imag_output_22__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_23__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_23__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_23)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_23)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_23)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_23)[j*4+3];
    __xlx_imag_output_23__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_23 = 16;
  int __xlx_offset_param_imag_output_23 = 0;
  int __xlx_offset_byte_param_imag_output_23 = 0*4;
  int* __xlx_imag_output_23__input_buffer= new int[__xlx_imag_output_23__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_23__tmp_vec.size(); ++i) {
    __xlx_imag_output_23__input_buffer[i] = __xlx_imag_output_23__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_24__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_24__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_24)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_24)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_24)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_24)[j*4+3];
    __xlx_imag_output_24__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_24 = 16;
  int __xlx_offset_param_imag_output_24 = 0;
  int __xlx_offset_byte_param_imag_output_24 = 0*4;
  int* __xlx_imag_output_24__input_buffer= new int[__xlx_imag_output_24__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_24__tmp_vec.size(); ++i) {
    __xlx_imag_output_24__input_buffer[i] = __xlx_imag_output_24__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_25__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_25__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_25)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_25)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_25)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_25)[j*4+3];
    __xlx_imag_output_25__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_25 = 16;
  int __xlx_offset_param_imag_output_25 = 0;
  int __xlx_offset_byte_param_imag_output_25 = 0*4;
  int* __xlx_imag_output_25__input_buffer= new int[__xlx_imag_output_25__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_25__tmp_vec.size(); ++i) {
    __xlx_imag_output_25__input_buffer[i] = __xlx_imag_output_25__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_26__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_26__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_26)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_26)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_26)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_26)[j*4+3];
    __xlx_imag_output_26__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_26 = 16;
  int __xlx_offset_param_imag_output_26 = 0;
  int __xlx_offset_byte_param_imag_output_26 = 0*4;
  int* __xlx_imag_output_26__input_buffer= new int[__xlx_imag_output_26__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_26__tmp_vec.size(); ++i) {
    __xlx_imag_output_26__input_buffer[i] = __xlx_imag_output_26__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_27__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_27__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_27)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_27)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_27)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_27)[j*4+3];
    __xlx_imag_output_27__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_27 = 16;
  int __xlx_offset_param_imag_output_27 = 0;
  int __xlx_offset_byte_param_imag_output_27 = 0*4;
  int* __xlx_imag_output_27__input_buffer= new int[__xlx_imag_output_27__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_27__tmp_vec.size(); ++i) {
    __xlx_imag_output_27__input_buffer[i] = __xlx_imag_output_27__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_28__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_28__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_28)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_28)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_28)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_28)[j*4+3];
    __xlx_imag_output_28__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_28 = 16;
  int __xlx_offset_param_imag_output_28 = 0;
  int __xlx_offset_byte_param_imag_output_28 = 0*4;
  int* __xlx_imag_output_28__input_buffer= new int[__xlx_imag_output_28__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_28__tmp_vec.size(); ++i) {
    __xlx_imag_output_28__input_buffer[i] = __xlx_imag_output_28__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_29__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_29__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_29)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_29)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_29)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_29)[j*4+3];
    __xlx_imag_output_29__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_29 = 16;
  int __xlx_offset_param_imag_output_29 = 0;
  int __xlx_offset_byte_param_imag_output_29 = 0*4;
  int* __xlx_imag_output_29__input_buffer= new int[__xlx_imag_output_29__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_29__tmp_vec.size(); ++i) {
    __xlx_imag_output_29__input_buffer[i] = __xlx_imag_output_29__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_30__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_30__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_30)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_30)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_30)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_30)[j*4+3];
    __xlx_imag_output_30__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_30 = 16;
  int __xlx_offset_param_imag_output_30 = 0;
  int __xlx_offset_byte_param_imag_output_30 = 0*4;
  int* __xlx_imag_output_30__input_buffer= new int[__xlx_imag_output_30__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_30__tmp_vec.size(); ++i) {
    __xlx_imag_output_30__input_buffer[i] = __xlx_imag_output_30__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_31__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_31__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_31)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_31)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_31)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_31)[j*4+3];
    __xlx_imag_output_31__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_31 = 16;
  int __xlx_offset_param_imag_output_31 = 0;
  int __xlx_offset_byte_param_imag_output_31 = 0*4;
  int* __xlx_imag_output_31__input_buffer= new int[__xlx_imag_output_31__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_31__tmp_vec.size(); ++i) {
    __xlx_imag_output_31__input_buffer[i] = __xlx_imag_output_31__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_32__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_32__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_32)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_32)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_32)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_32)[j*4+3];
    __xlx_imag_output_32__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_32 = 16;
  int __xlx_offset_param_imag_output_32 = 0;
  int __xlx_offset_byte_param_imag_output_32 = 0*4;
  int* __xlx_imag_output_32__input_buffer= new int[__xlx_imag_output_32__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_32__tmp_vec.size(); ++i) {
    __xlx_imag_output_32__input_buffer[i] = __xlx_imag_output_32__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_33__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_33__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_33)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_33)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_33)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_33)[j*4+3];
    __xlx_imag_output_33__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_33 = 16;
  int __xlx_offset_param_imag_output_33 = 0;
  int __xlx_offset_byte_param_imag_output_33 = 0*4;
  int* __xlx_imag_output_33__input_buffer= new int[__xlx_imag_output_33__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_33__tmp_vec.size(); ++i) {
    __xlx_imag_output_33__input_buffer[i] = __xlx_imag_output_33__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_34__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_34__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_34)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_34)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_34)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_34)[j*4+3];
    __xlx_imag_output_34__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_34 = 16;
  int __xlx_offset_param_imag_output_34 = 0;
  int __xlx_offset_byte_param_imag_output_34 = 0*4;
  int* __xlx_imag_output_34__input_buffer= new int[__xlx_imag_output_34__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_34__tmp_vec.size(); ++i) {
    __xlx_imag_output_34__input_buffer[i] = __xlx_imag_output_34__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_35__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_35__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_35)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_35)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_35)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_35)[j*4+3];
    __xlx_imag_output_35__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_35 = 16;
  int __xlx_offset_param_imag_output_35 = 0;
  int __xlx_offset_byte_param_imag_output_35 = 0*4;
  int* __xlx_imag_output_35__input_buffer= new int[__xlx_imag_output_35__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_35__tmp_vec.size(); ++i) {
    __xlx_imag_output_35__input_buffer[i] = __xlx_imag_output_35__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_36__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_36__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_36)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_36)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_36)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_36)[j*4+3];
    __xlx_imag_output_36__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_36 = 16;
  int __xlx_offset_param_imag_output_36 = 0;
  int __xlx_offset_byte_param_imag_output_36 = 0*4;
  int* __xlx_imag_output_36__input_buffer= new int[__xlx_imag_output_36__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_36__tmp_vec.size(); ++i) {
    __xlx_imag_output_36__input_buffer[i] = __xlx_imag_output_36__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_37__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_37__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_37)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_37)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_37)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_37)[j*4+3];
    __xlx_imag_output_37__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_37 = 16;
  int __xlx_offset_param_imag_output_37 = 0;
  int __xlx_offset_byte_param_imag_output_37 = 0*4;
  int* __xlx_imag_output_37__input_buffer= new int[__xlx_imag_output_37__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_37__tmp_vec.size(); ++i) {
    __xlx_imag_output_37__input_buffer[i] = __xlx_imag_output_37__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_38__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_38__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_38)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_38)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_38)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_38)[j*4+3];
    __xlx_imag_output_38__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_38 = 16;
  int __xlx_offset_param_imag_output_38 = 0;
  int __xlx_offset_byte_param_imag_output_38 = 0*4;
  int* __xlx_imag_output_38__input_buffer= new int[__xlx_imag_output_38__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_38__tmp_vec.size(); ++i) {
    __xlx_imag_output_38__input_buffer[i] = __xlx_imag_output_38__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_39__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_39__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_39)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_39)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_39)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_39)[j*4+3];
    __xlx_imag_output_39__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_39 = 16;
  int __xlx_offset_param_imag_output_39 = 0;
  int __xlx_offset_byte_param_imag_output_39 = 0*4;
  int* __xlx_imag_output_39__input_buffer= new int[__xlx_imag_output_39__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_39__tmp_vec.size(); ++i) {
    __xlx_imag_output_39__input_buffer[i] = __xlx_imag_output_39__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_40__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_40__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_40)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_40)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_40)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_40)[j*4+3];
    __xlx_imag_output_40__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_40 = 16;
  int __xlx_offset_param_imag_output_40 = 0;
  int __xlx_offset_byte_param_imag_output_40 = 0*4;
  int* __xlx_imag_output_40__input_buffer= new int[__xlx_imag_output_40__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_40__tmp_vec.size(); ++i) {
    __xlx_imag_output_40__input_buffer[i] = __xlx_imag_output_40__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_41__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_41__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_41)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_41)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_41)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_41)[j*4+3];
    __xlx_imag_output_41__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_41 = 16;
  int __xlx_offset_param_imag_output_41 = 0;
  int __xlx_offset_byte_param_imag_output_41 = 0*4;
  int* __xlx_imag_output_41__input_buffer= new int[__xlx_imag_output_41__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_41__tmp_vec.size(); ++i) {
    __xlx_imag_output_41__input_buffer[i] = __xlx_imag_output_41__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_42__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_42__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_42)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_42)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_42)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_42)[j*4+3];
    __xlx_imag_output_42__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_42 = 16;
  int __xlx_offset_param_imag_output_42 = 0;
  int __xlx_offset_byte_param_imag_output_42 = 0*4;
  int* __xlx_imag_output_42__input_buffer= new int[__xlx_imag_output_42__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_42__tmp_vec.size(); ++i) {
    __xlx_imag_output_42__input_buffer[i] = __xlx_imag_output_42__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_43__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_43__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_43)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_43)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_43)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_43)[j*4+3];
    __xlx_imag_output_43__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_43 = 16;
  int __xlx_offset_param_imag_output_43 = 0;
  int __xlx_offset_byte_param_imag_output_43 = 0*4;
  int* __xlx_imag_output_43__input_buffer= new int[__xlx_imag_output_43__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_43__tmp_vec.size(); ++i) {
    __xlx_imag_output_43__input_buffer[i] = __xlx_imag_output_43__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_44__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_44__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_44)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_44)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_44)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_44)[j*4+3];
    __xlx_imag_output_44__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_44 = 16;
  int __xlx_offset_param_imag_output_44 = 0;
  int __xlx_offset_byte_param_imag_output_44 = 0*4;
  int* __xlx_imag_output_44__input_buffer= new int[__xlx_imag_output_44__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_44__tmp_vec.size(); ++i) {
    __xlx_imag_output_44__input_buffer[i] = __xlx_imag_output_44__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_45__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_45__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_45)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_45)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_45)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_45)[j*4+3];
    __xlx_imag_output_45__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_45 = 16;
  int __xlx_offset_param_imag_output_45 = 0;
  int __xlx_offset_byte_param_imag_output_45 = 0*4;
  int* __xlx_imag_output_45__input_buffer= new int[__xlx_imag_output_45__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_45__tmp_vec.size(); ++i) {
    __xlx_imag_output_45__input_buffer[i] = __xlx_imag_output_45__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_46__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_46__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_46)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_46)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_46)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_46)[j*4+3];
    __xlx_imag_output_46__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_46 = 16;
  int __xlx_offset_param_imag_output_46 = 0;
  int __xlx_offset_byte_param_imag_output_46 = 0*4;
  int* __xlx_imag_output_46__input_buffer= new int[__xlx_imag_output_46__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_46__tmp_vec.size(); ++i) {
    __xlx_imag_output_46__input_buffer[i] = __xlx_imag_output_46__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_47__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_47__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_47)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_47)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_47)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_47)[j*4+3];
    __xlx_imag_output_47__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_47 = 16;
  int __xlx_offset_param_imag_output_47 = 0;
  int __xlx_offset_byte_param_imag_output_47 = 0*4;
  int* __xlx_imag_output_47__input_buffer= new int[__xlx_imag_output_47__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_47__tmp_vec.size(); ++i) {
    __xlx_imag_output_47__input_buffer[i] = __xlx_imag_output_47__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_48__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_48__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_48)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_48)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_48)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_48)[j*4+3];
    __xlx_imag_output_48__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_48 = 16;
  int __xlx_offset_param_imag_output_48 = 0;
  int __xlx_offset_byte_param_imag_output_48 = 0*4;
  int* __xlx_imag_output_48__input_buffer= new int[__xlx_imag_output_48__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_48__tmp_vec.size(); ++i) {
    __xlx_imag_output_48__input_buffer[i] = __xlx_imag_output_48__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_49__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_49__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_49)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_49)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_49)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_49)[j*4+3];
    __xlx_imag_output_49__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_49 = 16;
  int __xlx_offset_param_imag_output_49 = 0;
  int __xlx_offset_byte_param_imag_output_49 = 0*4;
  int* __xlx_imag_output_49__input_buffer= new int[__xlx_imag_output_49__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_49__tmp_vec.size(); ++i) {
    __xlx_imag_output_49__input_buffer[i] = __xlx_imag_output_49__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_50__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_50__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_50)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_50)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_50)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_50)[j*4+3];
    __xlx_imag_output_50__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_50 = 16;
  int __xlx_offset_param_imag_output_50 = 0;
  int __xlx_offset_byte_param_imag_output_50 = 0*4;
  int* __xlx_imag_output_50__input_buffer= new int[__xlx_imag_output_50__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_50__tmp_vec.size(); ++i) {
    __xlx_imag_output_50__input_buffer[i] = __xlx_imag_output_50__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_51__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_51__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_51)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_51)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_51)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_51)[j*4+3];
    __xlx_imag_output_51__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_51 = 16;
  int __xlx_offset_param_imag_output_51 = 0;
  int __xlx_offset_byte_param_imag_output_51 = 0*4;
  int* __xlx_imag_output_51__input_buffer= new int[__xlx_imag_output_51__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_51__tmp_vec.size(); ++i) {
    __xlx_imag_output_51__input_buffer[i] = __xlx_imag_output_51__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_52__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_52__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_52)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_52)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_52)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_52)[j*4+3];
    __xlx_imag_output_52__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_52 = 16;
  int __xlx_offset_param_imag_output_52 = 0;
  int __xlx_offset_byte_param_imag_output_52 = 0*4;
  int* __xlx_imag_output_52__input_buffer= new int[__xlx_imag_output_52__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_52__tmp_vec.size(); ++i) {
    __xlx_imag_output_52__input_buffer[i] = __xlx_imag_output_52__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_53__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_53__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_53)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_53)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_53)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_53)[j*4+3];
    __xlx_imag_output_53__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_53 = 16;
  int __xlx_offset_param_imag_output_53 = 0;
  int __xlx_offset_byte_param_imag_output_53 = 0*4;
  int* __xlx_imag_output_53__input_buffer= new int[__xlx_imag_output_53__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_53__tmp_vec.size(); ++i) {
    __xlx_imag_output_53__input_buffer[i] = __xlx_imag_output_53__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_54__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_54__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_54)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_54)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_54)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_54)[j*4+3];
    __xlx_imag_output_54__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_54 = 16;
  int __xlx_offset_param_imag_output_54 = 0;
  int __xlx_offset_byte_param_imag_output_54 = 0*4;
  int* __xlx_imag_output_54__input_buffer= new int[__xlx_imag_output_54__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_54__tmp_vec.size(); ++i) {
    __xlx_imag_output_54__input_buffer[i] = __xlx_imag_output_54__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_55__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_55__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_55)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_55)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_55)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_55)[j*4+3];
    __xlx_imag_output_55__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_55 = 16;
  int __xlx_offset_param_imag_output_55 = 0;
  int __xlx_offset_byte_param_imag_output_55 = 0*4;
  int* __xlx_imag_output_55__input_buffer= new int[__xlx_imag_output_55__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_55__tmp_vec.size(); ++i) {
    __xlx_imag_output_55__input_buffer[i] = __xlx_imag_output_55__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_56__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_56__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_56)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_56)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_56)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_56)[j*4+3];
    __xlx_imag_output_56__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_56 = 16;
  int __xlx_offset_param_imag_output_56 = 0;
  int __xlx_offset_byte_param_imag_output_56 = 0*4;
  int* __xlx_imag_output_56__input_buffer= new int[__xlx_imag_output_56__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_56__tmp_vec.size(); ++i) {
    __xlx_imag_output_56__input_buffer[i] = __xlx_imag_output_56__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_57__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_57__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_57)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_57)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_57)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_57)[j*4+3];
    __xlx_imag_output_57__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_57 = 16;
  int __xlx_offset_param_imag_output_57 = 0;
  int __xlx_offset_byte_param_imag_output_57 = 0*4;
  int* __xlx_imag_output_57__input_buffer= new int[__xlx_imag_output_57__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_57__tmp_vec.size(); ++i) {
    __xlx_imag_output_57__input_buffer[i] = __xlx_imag_output_57__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_58__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_58__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_58)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_58)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_58)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_58)[j*4+3];
    __xlx_imag_output_58__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_58 = 16;
  int __xlx_offset_param_imag_output_58 = 0;
  int __xlx_offset_byte_param_imag_output_58 = 0*4;
  int* __xlx_imag_output_58__input_buffer= new int[__xlx_imag_output_58__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_58__tmp_vec.size(); ++i) {
    __xlx_imag_output_58__input_buffer[i] = __xlx_imag_output_58__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_59__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_59__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_59)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_59)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_59)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_59)[j*4+3];
    __xlx_imag_output_59__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_59 = 16;
  int __xlx_offset_param_imag_output_59 = 0;
  int __xlx_offset_byte_param_imag_output_59 = 0*4;
  int* __xlx_imag_output_59__input_buffer= new int[__xlx_imag_output_59__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_59__tmp_vec.size(); ++i) {
    __xlx_imag_output_59__input_buffer[i] = __xlx_imag_output_59__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_60__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_60__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_60)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_60)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_60)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_60)[j*4+3];
    __xlx_imag_output_60__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_60 = 16;
  int __xlx_offset_param_imag_output_60 = 0;
  int __xlx_offset_byte_param_imag_output_60 = 0*4;
  int* __xlx_imag_output_60__input_buffer= new int[__xlx_imag_output_60__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_60__tmp_vec.size(); ++i) {
    __xlx_imag_output_60__input_buffer[i] = __xlx_imag_output_60__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_61__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_61__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_61)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_61)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_61)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_61)[j*4+3];
    __xlx_imag_output_61__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_61 = 16;
  int __xlx_offset_param_imag_output_61 = 0;
  int __xlx_offset_byte_param_imag_output_61 = 0*4;
  int* __xlx_imag_output_61__input_buffer= new int[__xlx_imag_output_61__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_61__tmp_vec.size(); ++i) {
    __xlx_imag_output_61__input_buffer[i] = __xlx_imag_output_61__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_62__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_62__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_62)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_62)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_62)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_62)[j*4+3];
    __xlx_imag_output_62__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_62 = 16;
  int __xlx_offset_param_imag_output_62 = 0;
  int __xlx_offset_byte_param_imag_output_62 = 0*4;
  int* __xlx_imag_output_62__input_buffer= new int[__xlx_imag_output_62__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_62__tmp_vec.size(); ++i) {
    __xlx_imag_output_62__input_buffer[i] = __xlx_imag_output_62__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_imag_output_63__tmp_vec
  vector<sc_bv<32> >__xlx_imag_output_63__tmp_vec;
  for (int j = 0, e = 16; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_imag_output_63)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_imag_output_63)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_imag_output_63)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_imag_output_63)[j*4+3];
    __xlx_imag_output_63__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_imag_output_63 = 16;
  int __xlx_offset_param_imag_output_63 = 0;
  int __xlx_offset_byte_param_imag_output_63 = 0*4;
  int* __xlx_imag_output_63__input_buffer= new int[__xlx_imag_output_63__tmp_vec.size()];
  for (int i = 0; i < __xlx_imag_output_63__tmp_vec.size(); ++i) {
    __xlx_imag_output_63__input_buffer[i] = __xlx_imag_output_63__tmp_vec[i].range(31, 0).to_uint64();
  }
  // DUT call
  dft(__xlx_real_sample_0__input_buffer, __xlx_real_sample_1__input_buffer, __xlx_real_sample_2__input_buffer, __xlx_real_sample_3__input_buffer, __xlx_real_sample_4__input_buffer, __xlx_real_sample_5__input_buffer, __xlx_real_sample_6__input_buffer, __xlx_real_sample_7__input_buffer, __xlx_real_sample_8__input_buffer, __xlx_real_sample_9__input_buffer, __xlx_real_sample_10__input_buffer, __xlx_real_sample_11__input_buffer, __xlx_real_sample_12__input_buffer, __xlx_real_sample_13__input_buffer, __xlx_real_sample_14__input_buffer, __xlx_real_sample_15__input_buffer, __xlx_real_sample_16__input_buffer, __xlx_real_sample_17__input_buffer, __xlx_real_sample_18__input_buffer, __xlx_real_sample_19__input_buffer, __xlx_real_sample_20__input_buffer, __xlx_real_sample_21__input_buffer, __xlx_real_sample_22__input_buffer, __xlx_real_sample_23__input_buffer, __xlx_real_sample_24__input_buffer, __xlx_real_sample_25__input_buffer, __xlx_real_sample_26__input_buffer, __xlx_real_sample_27__input_buffer, __xlx_real_sample_28__input_buffer, __xlx_real_sample_29__input_buffer, __xlx_real_sample_30__input_buffer, __xlx_real_sample_31__input_buffer, __xlx_real_sample_32__input_buffer, __xlx_real_sample_33__input_buffer, __xlx_real_sample_34__input_buffer, __xlx_real_sample_35__input_buffer, __xlx_real_sample_36__input_buffer, __xlx_real_sample_37__input_buffer, __xlx_real_sample_38__input_buffer, __xlx_real_sample_39__input_buffer, __xlx_real_sample_40__input_buffer, __xlx_real_sample_41__input_buffer, __xlx_real_sample_42__input_buffer, __xlx_real_sample_43__input_buffer, __xlx_real_sample_44__input_buffer, __xlx_real_sample_45__input_buffer, __xlx_real_sample_46__input_buffer, __xlx_real_sample_47__input_buffer, __xlx_real_sample_48__input_buffer, __xlx_real_sample_49__input_buffer, __xlx_real_sample_50__input_buffer, __xlx_real_sample_51__input_buffer, __xlx_real_sample_52__input_buffer, __xlx_real_sample_53__input_buffer, __xlx_real_sample_54__input_buffer, __xlx_real_sample_55__input_buffer, __xlx_real_sample_56__input_buffer, __xlx_real_sample_57__input_buffer, __xlx_real_sample_58__input_buffer, __xlx_real_sample_59__input_buffer, __xlx_real_sample_60__input_buffer, __xlx_real_sample_61__input_buffer, __xlx_real_sample_62__input_buffer, __xlx_real_sample_63__input_buffer, __xlx_imag_sample_0__input_buffer, __xlx_imag_sample_1__input_buffer, __xlx_imag_sample_2__input_buffer, __xlx_imag_sample_3__input_buffer, __xlx_imag_sample_4__input_buffer, __xlx_imag_sample_5__input_buffer, __xlx_imag_sample_6__input_buffer, __xlx_imag_sample_7__input_buffer, __xlx_imag_sample_8__input_buffer, __xlx_imag_sample_9__input_buffer, __xlx_imag_sample_10__input_buffer, __xlx_imag_sample_11__input_buffer, __xlx_imag_sample_12__input_buffer, __xlx_imag_sample_13__input_buffer, __xlx_imag_sample_14__input_buffer, __xlx_imag_sample_15__input_buffer, __xlx_imag_sample_16__input_buffer, __xlx_imag_sample_17__input_buffer, __xlx_imag_sample_18__input_buffer, __xlx_imag_sample_19__input_buffer, __xlx_imag_sample_20__input_buffer, __xlx_imag_sample_21__input_buffer, __xlx_imag_sample_22__input_buffer, __xlx_imag_sample_23__input_buffer, __xlx_imag_sample_24__input_buffer, __xlx_imag_sample_25__input_buffer, __xlx_imag_sample_26__input_buffer, __xlx_imag_sample_27__input_buffer, __xlx_imag_sample_28__input_buffer, __xlx_imag_sample_29__input_buffer, __xlx_imag_sample_30__input_buffer, __xlx_imag_sample_31__input_buffer, __xlx_imag_sample_32__input_buffer, __xlx_imag_sample_33__input_buffer, __xlx_imag_sample_34__input_buffer, __xlx_imag_sample_35__input_buffer, __xlx_imag_sample_36__input_buffer, __xlx_imag_sample_37__input_buffer, __xlx_imag_sample_38__input_buffer, __xlx_imag_sample_39__input_buffer, __xlx_imag_sample_40__input_buffer, __xlx_imag_sample_41__input_buffer, __xlx_imag_sample_42__input_buffer, __xlx_imag_sample_43__input_buffer, __xlx_imag_sample_44__input_buffer, __xlx_imag_sample_45__input_buffer, __xlx_imag_sample_46__input_buffer, __xlx_imag_sample_47__input_buffer, __xlx_imag_sample_48__input_buffer, __xlx_imag_sample_49__input_buffer, __xlx_imag_sample_50__input_buffer, __xlx_imag_sample_51__input_buffer, __xlx_imag_sample_52__input_buffer, __xlx_imag_sample_53__input_buffer, __xlx_imag_sample_54__input_buffer, __xlx_imag_sample_55__input_buffer, __xlx_imag_sample_56__input_buffer, __xlx_imag_sample_57__input_buffer, __xlx_imag_sample_58__input_buffer, __xlx_imag_sample_59__input_buffer, __xlx_imag_sample_60__input_buffer, __xlx_imag_sample_61__input_buffer, __xlx_imag_sample_62__input_buffer, __xlx_imag_sample_63__input_buffer, __xlx_real_output_0__input_buffer, __xlx_real_output_1__input_buffer, __xlx_real_output_2__input_buffer, __xlx_real_output_3__input_buffer, __xlx_real_output_4__input_buffer, __xlx_real_output_5__input_buffer, __xlx_real_output_6__input_buffer, __xlx_real_output_7__input_buffer, __xlx_real_output_8__input_buffer, __xlx_real_output_9__input_buffer, __xlx_real_output_10__input_buffer, __xlx_real_output_11__input_buffer, __xlx_real_output_12__input_buffer, __xlx_real_output_13__input_buffer, __xlx_real_output_14__input_buffer, __xlx_real_output_15__input_buffer, __xlx_real_output_16__input_buffer, __xlx_real_output_17__input_buffer, __xlx_real_output_18__input_buffer, __xlx_real_output_19__input_buffer, __xlx_real_output_20__input_buffer, __xlx_real_output_21__input_buffer, __xlx_real_output_22__input_buffer, __xlx_real_output_23__input_buffer, __xlx_real_output_24__input_buffer, __xlx_real_output_25__input_buffer, __xlx_real_output_26__input_buffer, __xlx_real_output_27__input_buffer, __xlx_real_output_28__input_buffer, __xlx_real_output_29__input_buffer, __xlx_real_output_30__input_buffer, __xlx_real_output_31__input_buffer, __xlx_real_output_32__input_buffer, __xlx_real_output_33__input_buffer, __xlx_real_output_34__input_buffer, __xlx_real_output_35__input_buffer, __xlx_real_output_36__input_buffer, __xlx_real_output_37__input_buffer, __xlx_real_output_38__input_buffer, __xlx_real_output_39__input_buffer, __xlx_real_output_40__input_buffer, __xlx_real_output_41__input_buffer, __xlx_real_output_42__input_buffer, __xlx_real_output_43__input_buffer, __xlx_real_output_44__input_buffer, __xlx_real_output_45__input_buffer, __xlx_real_output_46__input_buffer, __xlx_real_output_47__input_buffer, __xlx_real_output_48__input_buffer, __xlx_real_output_49__input_buffer, __xlx_real_output_50__input_buffer, __xlx_real_output_51__input_buffer, __xlx_real_output_52__input_buffer, __xlx_real_output_53__input_buffer, __xlx_real_output_54__input_buffer, __xlx_real_output_55__input_buffer, __xlx_real_output_56__input_buffer, __xlx_real_output_57__input_buffer, __xlx_real_output_58__input_buffer, __xlx_real_output_59__input_buffer, __xlx_real_output_60__input_buffer, __xlx_real_output_61__input_buffer, __xlx_real_output_62__input_buffer, __xlx_real_output_63__input_buffer, __xlx_imag_output_0__input_buffer, __xlx_imag_output_1__input_buffer, __xlx_imag_output_2__input_buffer, __xlx_imag_output_3__input_buffer, __xlx_imag_output_4__input_buffer, __xlx_imag_output_5__input_buffer, __xlx_imag_output_6__input_buffer, __xlx_imag_output_7__input_buffer, __xlx_imag_output_8__input_buffer, __xlx_imag_output_9__input_buffer, __xlx_imag_output_10__input_buffer, __xlx_imag_output_11__input_buffer, __xlx_imag_output_12__input_buffer, __xlx_imag_output_13__input_buffer, __xlx_imag_output_14__input_buffer, __xlx_imag_output_15__input_buffer, __xlx_imag_output_16__input_buffer, __xlx_imag_output_17__input_buffer, __xlx_imag_output_18__input_buffer, __xlx_imag_output_19__input_buffer, __xlx_imag_output_20__input_buffer, __xlx_imag_output_21__input_buffer, __xlx_imag_output_22__input_buffer, __xlx_imag_output_23__input_buffer, __xlx_imag_output_24__input_buffer, __xlx_imag_output_25__input_buffer, __xlx_imag_output_26__input_buffer, __xlx_imag_output_27__input_buffer, __xlx_imag_output_28__input_buffer, __xlx_imag_output_29__input_buffer, __xlx_imag_output_30__input_buffer, __xlx_imag_output_31__input_buffer, __xlx_imag_output_32__input_buffer, __xlx_imag_output_33__input_buffer, __xlx_imag_output_34__input_buffer, __xlx_imag_output_35__input_buffer, __xlx_imag_output_36__input_buffer, __xlx_imag_output_37__input_buffer, __xlx_imag_output_38__input_buffer, __xlx_imag_output_39__input_buffer, __xlx_imag_output_40__input_buffer, __xlx_imag_output_41__input_buffer, __xlx_imag_output_42__input_buffer, __xlx_imag_output_43__input_buffer, __xlx_imag_output_44__input_buffer, __xlx_imag_output_45__input_buffer, __xlx_imag_output_46__input_buffer, __xlx_imag_output_47__input_buffer, __xlx_imag_output_48__input_buffer, __xlx_imag_output_49__input_buffer, __xlx_imag_output_50__input_buffer, __xlx_imag_output_51__input_buffer, __xlx_imag_output_52__input_buffer, __xlx_imag_output_53__input_buffer, __xlx_imag_output_54__input_buffer, __xlx_imag_output_55__input_buffer, __xlx_imag_output_56__input_buffer, __xlx_imag_output_57__input_buffer, __xlx_imag_output_58__input_buffer, __xlx_imag_output_59__input_buffer, __xlx_imag_output_60__input_buffer, __xlx_imag_output_61__input_buffer, __xlx_imag_output_62__input_buffer, __xlx_imag_output_63__input_buffer);
// print __xlx_apatb_param_real_sample_0
  sc_bv<32>*__xlx_real_sample_0_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_0];
  for (int i = 0; i < __xlx_size_param_real_sample_0; ++i) {
    __xlx_real_sample_0_output_buffer[i] = __xlx_real_sample_0__input_buffer[i+__xlx_offset_param_real_sample_0];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_0; ++i) {
    ((char*)__xlx_apatb_param_real_sample_0)[i*4+0] = __xlx_real_sample_0_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_0)[i*4+1] = __xlx_real_sample_0_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_0)[i*4+2] = __xlx_real_sample_0_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_0)[i*4+3] = __xlx_real_sample_0_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_1
  sc_bv<32>*__xlx_real_sample_1_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_1];
  for (int i = 0; i < __xlx_size_param_real_sample_1; ++i) {
    __xlx_real_sample_1_output_buffer[i] = __xlx_real_sample_1__input_buffer[i+__xlx_offset_param_real_sample_1];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_1; ++i) {
    ((char*)__xlx_apatb_param_real_sample_1)[i*4+0] = __xlx_real_sample_1_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_1)[i*4+1] = __xlx_real_sample_1_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_1)[i*4+2] = __xlx_real_sample_1_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_1)[i*4+3] = __xlx_real_sample_1_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_2
  sc_bv<32>*__xlx_real_sample_2_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_2];
  for (int i = 0; i < __xlx_size_param_real_sample_2; ++i) {
    __xlx_real_sample_2_output_buffer[i] = __xlx_real_sample_2__input_buffer[i+__xlx_offset_param_real_sample_2];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_2; ++i) {
    ((char*)__xlx_apatb_param_real_sample_2)[i*4+0] = __xlx_real_sample_2_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_2)[i*4+1] = __xlx_real_sample_2_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_2)[i*4+2] = __xlx_real_sample_2_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_2)[i*4+3] = __xlx_real_sample_2_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_3
  sc_bv<32>*__xlx_real_sample_3_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_3];
  for (int i = 0; i < __xlx_size_param_real_sample_3; ++i) {
    __xlx_real_sample_3_output_buffer[i] = __xlx_real_sample_3__input_buffer[i+__xlx_offset_param_real_sample_3];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_3; ++i) {
    ((char*)__xlx_apatb_param_real_sample_3)[i*4+0] = __xlx_real_sample_3_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_3)[i*4+1] = __xlx_real_sample_3_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_3)[i*4+2] = __xlx_real_sample_3_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_3)[i*4+3] = __xlx_real_sample_3_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_4
  sc_bv<32>*__xlx_real_sample_4_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_4];
  for (int i = 0; i < __xlx_size_param_real_sample_4; ++i) {
    __xlx_real_sample_4_output_buffer[i] = __xlx_real_sample_4__input_buffer[i+__xlx_offset_param_real_sample_4];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_4; ++i) {
    ((char*)__xlx_apatb_param_real_sample_4)[i*4+0] = __xlx_real_sample_4_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_4)[i*4+1] = __xlx_real_sample_4_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_4)[i*4+2] = __xlx_real_sample_4_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_4)[i*4+3] = __xlx_real_sample_4_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_5
  sc_bv<32>*__xlx_real_sample_5_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_5];
  for (int i = 0; i < __xlx_size_param_real_sample_5; ++i) {
    __xlx_real_sample_5_output_buffer[i] = __xlx_real_sample_5__input_buffer[i+__xlx_offset_param_real_sample_5];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_5; ++i) {
    ((char*)__xlx_apatb_param_real_sample_5)[i*4+0] = __xlx_real_sample_5_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_5)[i*4+1] = __xlx_real_sample_5_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_5)[i*4+2] = __xlx_real_sample_5_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_5)[i*4+3] = __xlx_real_sample_5_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_6
  sc_bv<32>*__xlx_real_sample_6_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_6];
  for (int i = 0; i < __xlx_size_param_real_sample_6; ++i) {
    __xlx_real_sample_6_output_buffer[i] = __xlx_real_sample_6__input_buffer[i+__xlx_offset_param_real_sample_6];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_6; ++i) {
    ((char*)__xlx_apatb_param_real_sample_6)[i*4+0] = __xlx_real_sample_6_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_6)[i*4+1] = __xlx_real_sample_6_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_6)[i*4+2] = __xlx_real_sample_6_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_6)[i*4+3] = __xlx_real_sample_6_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_7
  sc_bv<32>*__xlx_real_sample_7_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_7];
  for (int i = 0; i < __xlx_size_param_real_sample_7; ++i) {
    __xlx_real_sample_7_output_buffer[i] = __xlx_real_sample_7__input_buffer[i+__xlx_offset_param_real_sample_7];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_7; ++i) {
    ((char*)__xlx_apatb_param_real_sample_7)[i*4+0] = __xlx_real_sample_7_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_7)[i*4+1] = __xlx_real_sample_7_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_7)[i*4+2] = __xlx_real_sample_7_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_7)[i*4+3] = __xlx_real_sample_7_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_8
  sc_bv<32>*__xlx_real_sample_8_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_8];
  for (int i = 0; i < __xlx_size_param_real_sample_8; ++i) {
    __xlx_real_sample_8_output_buffer[i] = __xlx_real_sample_8__input_buffer[i+__xlx_offset_param_real_sample_8];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_8; ++i) {
    ((char*)__xlx_apatb_param_real_sample_8)[i*4+0] = __xlx_real_sample_8_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_8)[i*4+1] = __xlx_real_sample_8_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_8)[i*4+2] = __xlx_real_sample_8_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_8)[i*4+3] = __xlx_real_sample_8_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_9
  sc_bv<32>*__xlx_real_sample_9_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_9];
  for (int i = 0; i < __xlx_size_param_real_sample_9; ++i) {
    __xlx_real_sample_9_output_buffer[i] = __xlx_real_sample_9__input_buffer[i+__xlx_offset_param_real_sample_9];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_9; ++i) {
    ((char*)__xlx_apatb_param_real_sample_9)[i*4+0] = __xlx_real_sample_9_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_9)[i*4+1] = __xlx_real_sample_9_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_9)[i*4+2] = __xlx_real_sample_9_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_9)[i*4+3] = __xlx_real_sample_9_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_10
  sc_bv<32>*__xlx_real_sample_10_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_10];
  for (int i = 0; i < __xlx_size_param_real_sample_10; ++i) {
    __xlx_real_sample_10_output_buffer[i] = __xlx_real_sample_10__input_buffer[i+__xlx_offset_param_real_sample_10];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_10; ++i) {
    ((char*)__xlx_apatb_param_real_sample_10)[i*4+0] = __xlx_real_sample_10_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_10)[i*4+1] = __xlx_real_sample_10_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_10)[i*4+2] = __xlx_real_sample_10_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_10)[i*4+3] = __xlx_real_sample_10_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_11
  sc_bv<32>*__xlx_real_sample_11_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_11];
  for (int i = 0; i < __xlx_size_param_real_sample_11; ++i) {
    __xlx_real_sample_11_output_buffer[i] = __xlx_real_sample_11__input_buffer[i+__xlx_offset_param_real_sample_11];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_11; ++i) {
    ((char*)__xlx_apatb_param_real_sample_11)[i*4+0] = __xlx_real_sample_11_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_11)[i*4+1] = __xlx_real_sample_11_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_11)[i*4+2] = __xlx_real_sample_11_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_11)[i*4+3] = __xlx_real_sample_11_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_12
  sc_bv<32>*__xlx_real_sample_12_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_12];
  for (int i = 0; i < __xlx_size_param_real_sample_12; ++i) {
    __xlx_real_sample_12_output_buffer[i] = __xlx_real_sample_12__input_buffer[i+__xlx_offset_param_real_sample_12];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_12; ++i) {
    ((char*)__xlx_apatb_param_real_sample_12)[i*4+0] = __xlx_real_sample_12_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_12)[i*4+1] = __xlx_real_sample_12_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_12)[i*4+2] = __xlx_real_sample_12_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_12)[i*4+3] = __xlx_real_sample_12_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_13
  sc_bv<32>*__xlx_real_sample_13_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_13];
  for (int i = 0; i < __xlx_size_param_real_sample_13; ++i) {
    __xlx_real_sample_13_output_buffer[i] = __xlx_real_sample_13__input_buffer[i+__xlx_offset_param_real_sample_13];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_13; ++i) {
    ((char*)__xlx_apatb_param_real_sample_13)[i*4+0] = __xlx_real_sample_13_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_13)[i*4+1] = __xlx_real_sample_13_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_13)[i*4+2] = __xlx_real_sample_13_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_13)[i*4+3] = __xlx_real_sample_13_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_14
  sc_bv<32>*__xlx_real_sample_14_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_14];
  for (int i = 0; i < __xlx_size_param_real_sample_14; ++i) {
    __xlx_real_sample_14_output_buffer[i] = __xlx_real_sample_14__input_buffer[i+__xlx_offset_param_real_sample_14];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_14; ++i) {
    ((char*)__xlx_apatb_param_real_sample_14)[i*4+0] = __xlx_real_sample_14_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_14)[i*4+1] = __xlx_real_sample_14_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_14)[i*4+2] = __xlx_real_sample_14_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_14)[i*4+3] = __xlx_real_sample_14_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_15
  sc_bv<32>*__xlx_real_sample_15_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_15];
  for (int i = 0; i < __xlx_size_param_real_sample_15; ++i) {
    __xlx_real_sample_15_output_buffer[i] = __xlx_real_sample_15__input_buffer[i+__xlx_offset_param_real_sample_15];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_15; ++i) {
    ((char*)__xlx_apatb_param_real_sample_15)[i*4+0] = __xlx_real_sample_15_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_15)[i*4+1] = __xlx_real_sample_15_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_15)[i*4+2] = __xlx_real_sample_15_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_15)[i*4+3] = __xlx_real_sample_15_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_16
  sc_bv<32>*__xlx_real_sample_16_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_16];
  for (int i = 0; i < __xlx_size_param_real_sample_16; ++i) {
    __xlx_real_sample_16_output_buffer[i] = __xlx_real_sample_16__input_buffer[i+__xlx_offset_param_real_sample_16];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_16; ++i) {
    ((char*)__xlx_apatb_param_real_sample_16)[i*4+0] = __xlx_real_sample_16_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_16)[i*4+1] = __xlx_real_sample_16_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_16)[i*4+2] = __xlx_real_sample_16_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_16)[i*4+3] = __xlx_real_sample_16_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_17
  sc_bv<32>*__xlx_real_sample_17_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_17];
  for (int i = 0; i < __xlx_size_param_real_sample_17; ++i) {
    __xlx_real_sample_17_output_buffer[i] = __xlx_real_sample_17__input_buffer[i+__xlx_offset_param_real_sample_17];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_17; ++i) {
    ((char*)__xlx_apatb_param_real_sample_17)[i*4+0] = __xlx_real_sample_17_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_17)[i*4+1] = __xlx_real_sample_17_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_17)[i*4+2] = __xlx_real_sample_17_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_17)[i*4+3] = __xlx_real_sample_17_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_18
  sc_bv<32>*__xlx_real_sample_18_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_18];
  for (int i = 0; i < __xlx_size_param_real_sample_18; ++i) {
    __xlx_real_sample_18_output_buffer[i] = __xlx_real_sample_18__input_buffer[i+__xlx_offset_param_real_sample_18];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_18; ++i) {
    ((char*)__xlx_apatb_param_real_sample_18)[i*4+0] = __xlx_real_sample_18_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_18)[i*4+1] = __xlx_real_sample_18_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_18)[i*4+2] = __xlx_real_sample_18_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_18)[i*4+3] = __xlx_real_sample_18_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_19
  sc_bv<32>*__xlx_real_sample_19_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_19];
  for (int i = 0; i < __xlx_size_param_real_sample_19; ++i) {
    __xlx_real_sample_19_output_buffer[i] = __xlx_real_sample_19__input_buffer[i+__xlx_offset_param_real_sample_19];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_19; ++i) {
    ((char*)__xlx_apatb_param_real_sample_19)[i*4+0] = __xlx_real_sample_19_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_19)[i*4+1] = __xlx_real_sample_19_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_19)[i*4+2] = __xlx_real_sample_19_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_19)[i*4+3] = __xlx_real_sample_19_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_20
  sc_bv<32>*__xlx_real_sample_20_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_20];
  for (int i = 0; i < __xlx_size_param_real_sample_20; ++i) {
    __xlx_real_sample_20_output_buffer[i] = __xlx_real_sample_20__input_buffer[i+__xlx_offset_param_real_sample_20];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_20; ++i) {
    ((char*)__xlx_apatb_param_real_sample_20)[i*4+0] = __xlx_real_sample_20_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_20)[i*4+1] = __xlx_real_sample_20_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_20)[i*4+2] = __xlx_real_sample_20_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_20)[i*4+3] = __xlx_real_sample_20_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_21
  sc_bv<32>*__xlx_real_sample_21_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_21];
  for (int i = 0; i < __xlx_size_param_real_sample_21; ++i) {
    __xlx_real_sample_21_output_buffer[i] = __xlx_real_sample_21__input_buffer[i+__xlx_offset_param_real_sample_21];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_21; ++i) {
    ((char*)__xlx_apatb_param_real_sample_21)[i*4+0] = __xlx_real_sample_21_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_21)[i*4+1] = __xlx_real_sample_21_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_21)[i*4+2] = __xlx_real_sample_21_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_21)[i*4+3] = __xlx_real_sample_21_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_22
  sc_bv<32>*__xlx_real_sample_22_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_22];
  for (int i = 0; i < __xlx_size_param_real_sample_22; ++i) {
    __xlx_real_sample_22_output_buffer[i] = __xlx_real_sample_22__input_buffer[i+__xlx_offset_param_real_sample_22];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_22; ++i) {
    ((char*)__xlx_apatb_param_real_sample_22)[i*4+0] = __xlx_real_sample_22_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_22)[i*4+1] = __xlx_real_sample_22_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_22)[i*4+2] = __xlx_real_sample_22_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_22)[i*4+3] = __xlx_real_sample_22_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_23
  sc_bv<32>*__xlx_real_sample_23_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_23];
  for (int i = 0; i < __xlx_size_param_real_sample_23; ++i) {
    __xlx_real_sample_23_output_buffer[i] = __xlx_real_sample_23__input_buffer[i+__xlx_offset_param_real_sample_23];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_23; ++i) {
    ((char*)__xlx_apatb_param_real_sample_23)[i*4+0] = __xlx_real_sample_23_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_23)[i*4+1] = __xlx_real_sample_23_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_23)[i*4+2] = __xlx_real_sample_23_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_23)[i*4+3] = __xlx_real_sample_23_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_24
  sc_bv<32>*__xlx_real_sample_24_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_24];
  for (int i = 0; i < __xlx_size_param_real_sample_24; ++i) {
    __xlx_real_sample_24_output_buffer[i] = __xlx_real_sample_24__input_buffer[i+__xlx_offset_param_real_sample_24];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_24; ++i) {
    ((char*)__xlx_apatb_param_real_sample_24)[i*4+0] = __xlx_real_sample_24_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_24)[i*4+1] = __xlx_real_sample_24_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_24)[i*4+2] = __xlx_real_sample_24_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_24)[i*4+3] = __xlx_real_sample_24_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_25
  sc_bv<32>*__xlx_real_sample_25_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_25];
  for (int i = 0; i < __xlx_size_param_real_sample_25; ++i) {
    __xlx_real_sample_25_output_buffer[i] = __xlx_real_sample_25__input_buffer[i+__xlx_offset_param_real_sample_25];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_25; ++i) {
    ((char*)__xlx_apatb_param_real_sample_25)[i*4+0] = __xlx_real_sample_25_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_25)[i*4+1] = __xlx_real_sample_25_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_25)[i*4+2] = __xlx_real_sample_25_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_25)[i*4+3] = __xlx_real_sample_25_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_26
  sc_bv<32>*__xlx_real_sample_26_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_26];
  for (int i = 0; i < __xlx_size_param_real_sample_26; ++i) {
    __xlx_real_sample_26_output_buffer[i] = __xlx_real_sample_26__input_buffer[i+__xlx_offset_param_real_sample_26];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_26; ++i) {
    ((char*)__xlx_apatb_param_real_sample_26)[i*4+0] = __xlx_real_sample_26_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_26)[i*4+1] = __xlx_real_sample_26_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_26)[i*4+2] = __xlx_real_sample_26_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_26)[i*4+3] = __xlx_real_sample_26_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_27
  sc_bv<32>*__xlx_real_sample_27_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_27];
  for (int i = 0; i < __xlx_size_param_real_sample_27; ++i) {
    __xlx_real_sample_27_output_buffer[i] = __xlx_real_sample_27__input_buffer[i+__xlx_offset_param_real_sample_27];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_27; ++i) {
    ((char*)__xlx_apatb_param_real_sample_27)[i*4+0] = __xlx_real_sample_27_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_27)[i*4+1] = __xlx_real_sample_27_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_27)[i*4+2] = __xlx_real_sample_27_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_27)[i*4+3] = __xlx_real_sample_27_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_28
  sc_bv<32>*__xlx_real_sample_28_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_28];
  for (int i = 0; i < __xlx_size_param_real_sample_28; ++i) {
    __xlx_real_sample_28_output_buffer[i] = __xlx_real_sample_28__input_buffer[i+__xlx_offset_param_real_sample_28];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_28; ++i) {
    ((char*)__xlx_apatb_param_real_sample_28)[i*4+0] = __xlx_real_sample_28_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_28)[i*4+1] = __xlx_real_sample_28_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_28)[i*4+2] = __xlx_real_sample_28_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_28)[i*4+3] = __xlx_real_sample_28_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_29
  sc_bv<32>*__xlx_real_sample_29_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_29];
  for (int i = 0; i < __xlx_size_param_real_sample_29; ++i) {
    __xlx_real_sample_29_output_buffer[i] = __xlx_real_sample_29__input_buffer[i+__xlx_offset_param_real_sample_29];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_29; ++i) {
    ((char*)__xlx_apatb_param_real_sample_29)[i*4+0] = __xlx_real_sample_29_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_29)[i*4+1] = __xlx_real_sample_29_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_29)[i*4+2] = __xlx_real_sample_29_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_29)[i*4+3] = __xlx_real_sample_29_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_30
  sc_bv<32>*__xlx_real_sample_30_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_30];
  for (int i = 0; i < __xlx_size_param_real_sample_30; ++i) {
    __xlx_real_sample_30_output_buffer[i] = __xlx_real_sample_30__input_buffer[i+__xlx_offset_param_real_sample_30];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_30; ++i) {
    ((char*)__xlx_apatb_param_real_sample_30)[i*4+0] = __xlx_real_sample_30_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_30)[i*4+1] = __xlx_real_sample_30_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_30)[i*4+2] = __xlx_real_sample_30_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_30)[i*4+3] = __xlx_real_sample_30_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_31
  sc_bv<32>*__xlx_real_sample_31_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_31];
  for (int i = 0; i < __xlx_size_param_real_sample_31; ++i) {
    __xlx_real_sample_31_output_buffer[i] = __xlx_real_sample_31__input_buffer[i+__xlx_offset_param_real_sample_31];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_31; ++i) {
    ((char*)__xlx_apatb_param_real_sample_31)[i*4+0] = __xlx_real_sample_31_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_31)[i*4+1] = __xlx_real_sample_31_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_31)[i*4+2] = __xlx_real_sample_31_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_31)[i*4+3] = __xlx_real_sample_31_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_32
  sc_bv<32>*__xlx_real_sample_32_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_32];
  for (int i = 0; i < __xlx_size_param_real_sample_32; ++i) {
    __xlx_real_sample_32_output_buffer[i] = __xlx_real_sample_32__input_buffer[i+__xlx_offset_param_real_sample_32];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_32; ++i) {
    ((char*)__xlx_apatb_param_real_sample_32)[i*4+0] = __xlx_real_sample_32_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_32)[i*4+1] = __xlx_real_sample_32_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_32)[i*4+2] = __xlx_real_sample_32_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_32)[i*4+3] = __xlx_real_sample_32_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_33
  sc_bv<32>*__xlx_real_sample_33_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_33];
  for (int i = 0; i < __xlx_size_param_real_sample_33; ++i) {
    __xlx_real_sample_33_output_buffer[i] = __xlx_real_sample_33__input_buffer[i+__xlx_offset_param_real_sample_33];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_33; ++i) {
    ((char*)__xlx_apatb_param_real_sample_33)[i*4+0] = __xlx_real_sample_33_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_33)[i*4+1] = __xlx_real_sample_33_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_33)[i*4+2] = __xlx_real_sample_33_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_33)[i*4+3] = __xlx_real_sample_33_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_34
  sc_bv<32>*__xlx_real_sample_34_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_34];
  for (int i = 0; i < __xlx_size_param_real_sample_34; ++i) {
    __xlx_real_sample_34_output_buffer[i] = __xlx_real_sample_34__input_buffer[i+__xlx_offset_param_real_sample_34];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_34; ++i) {
    ((char*)__xlx_apatb_param_real_sample_34)[i*4+0] = __xlx_real_sample_34_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_34)[i*4+1] = __xlx_real_sample_34_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_34)[i*4+2] = __xlx_real_sample_34_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_34)[i*4+3] = __xlx_real_sample_34_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_35
  sc_bv<32>*__xlx_real_sample_35_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_35];
  for (int i = 0; i < __xlx_size_param_real_sample_35; ++i) {
    __xlx_real_sample_35_output_buffer[i] = __xlx_real_sample_35__input_buffer[i+__xlx_offset_param_real_sample_35];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_35; ++i) {
    ((char*)__xlx_apatb_param_real_sample_35)[i*4+0] = __xlx_real_sample_35_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_35)[i*4+1] = __xlx_real_sample_35_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_35)[i*4+2] = __xlx_real_sample_35_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_35)[i*4+3] = __xlx_real_sample_35_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_36
  sc_bv<32>*__xlx_real_sample_36_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_36];
  for (int i = 0; i < __xlx_size_param_real_sample_36; ++i) {
    __xlx_real_sample_36_output_buffer[i] = __xlx_real_sample_36__input_buffer[i+__xlx_offset_param_real_sample_36];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_36; ++i) {
    ((char*)__xlx_apatb_param_real_sample_36)[i*4+0] = __xlx_real_sample_36_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_36)[i*4+1] = __xlx_real_sample_36_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_36)[i*4+2] = __xlx_real_sample_36_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_36)[i*4+3] = __xlx_real_sample_36_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_37
  sc_bv<32>*__xlx_real_sample_37_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_37];
  for (int i = 0; i < __xlx_size_param_real_sample_37; ++i) {
    __xlx_real_sample_37_output_buffer[i] = __xlx_real_sample_37__input_buffer[i+__xlx_offset_param_real_sample_37];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_37; ++i) {
    ((char*)__xlx_apatb_param_real_sample_37)[i*4+0] = __xlx_real_sample_37_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_37)[i*4+1] = __xlx_real_sample_37_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_37)[i*4+2] = __xlx_real_sample_37_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_37)[i*4+3] = __xlx_real_sample_37_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_38
  sc_bv<32>*__xlx_real_sample_38_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_38];
  for (int i = 0; i < __xlx_size_param_real_sample_38; ++i) {
    __xlx_real_sample_38_output_buffer[i] = __xlx_real_sample_38__input_buffer[i+__xlx_offset_param_real_sample_38];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_38; ++i) {
    ((char*)__xlx_apatb_param_real_sample_38)[i*4+0] = __xlx_real_sample_38_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_38)[i*4+1] = __xlx_real_sample_38_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_38)[i*4+2] = __xlx_real_sample_38_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_38)[i*4+3] = __xlx_real_sample_38_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_39
  sc_bv<32>*__xlx_real_sample_39_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_39];
  for (int i = 0; i < __xlx_size_param_real_sample_39; ++i) {
    __xlx_real_sample_39_output_buffer[i] = __xlx_real_sample_39__input_buffer[i+__xlx_offset_param_real_sample_39];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_39; ++i) {
    ((char*)__xlx_apatb_param_real_sample_39)[i*4+0] = __xlx_real_sample_39_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_39)[i*4+1] = __xlx_real_sample_39_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_39)[i*4+2] = __xlx_real_sample_39_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_39)[i*4+3] = __xlx_real_sample_39_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_40
  sc_bv<32>*__xlx_real_sample_40_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_40];
  for (int i = 0; i < __xlx_size_param_real_sample_40; ++i) {
    __xlx_real_sample_40_output_buffer[i] = __xlx_real_sample_40__input_buffer[i+__xlx_offset_param_real_sample_40];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_40; ++i) {
    ((char*)__xlx_apatb_param_real_sample_40)[i*4+0] = __xlx_real_sample_40_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_40)[i*4+1] = __xlx_real_sample_40_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_40)[i*4+2] = __xlx_real_sample_40_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_40)[i*4+3] = __xlx_real_sample_40_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_41
  sc_bv<32>*__xlx_real_sample_41_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_41];
  for (int i = 0; i < __xlx_size_param_real_sample_41; ++i) {
    __xlx_real_sample_41_output_buffer[i] = __xlx_real_sample_41__input_buffer[i+__xlx_offset_param_real_sample_41];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_41; ++i) {
    ((char*)__xlx_apatb_param_real_sample_41)[i*4+0] = __xlx_real_sample_41_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_41)[i*4+1] = __xlx_real_sample_41_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_41)[i*4+2] = __xlx_real_sample_41_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_41)[i*4+3] = __xlx_real_sample_41_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_42
  sc_bv<32>*__xlx_real_sample_42_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_42];
  for (int i = 0; i < __xlx_size_param_real_sample_42; ++i) {
    __xlx_real_sample_42_output_buffer[i] = __xlx_real_sample_42__input_buffer[i+__xlx_offset_param_real_sample_42];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_42; ++i) {
    ((char*)__xlx_apatb_param_real_sample_42)[i*4+0] = __xlx_real_sample_42_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_42)[i*4+1] = __xlx_real_sample_42_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_42)[i*4+2] = __xlx_real_sample_42_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_42)[i*4+3] = __xlx_real_sample_42_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_43
  sc_bv<32>*__xlx_real_sample_43_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_43];
  for (int i = 0; i < __xlx_size_param_real_sample_43; ++i) {
    __xlx_real_sample_43_output_buffer[i] = __xlx_real_sample_43__input_buffer[i+__xlx_offset_param_real_sample_43];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_43; ++i) {
    ((char*)__xlx_apatb_param_real_sample_43)[i*4+0] = __xlx_real_sample_43_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_43)[i*4+1] = __xlx_real_sample_43_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_43)[i*4+2] = __xlx_real_sample_43_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_43)[i*4+3] = __xlx_real_sample_43_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_44
  sc_bv<32>*__xlx_real_sample_44_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_44];
  for (int i = 0; i < __xlx_size_param_real_sample_44; ++i) {
    __xlx_real_sample_44_output_buffer[i] = __xlx_real_sample_44__input_buffer[i+__xlx_offset_param_real_sample_44];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_44; ++i) {
    ((char*)__xlx_apatb_param_real_sample_44)[i*4+0] = __xlx_real_sample_44_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_44)[i*4+1] = __xlx_real_sample_44_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_44)[i*4+2] = __xlx_real_sample_44_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_44)[i*4+3] = __xlx_real_sample_44_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_45
  sc_bv<32>*__xlx_real_sample_45_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_45];
  for (int i = 0; i < __xlx_size_param_real_sample_45; ++i) {
    __xlx_real_sample_45_output_buffer[i] = __xlx_real_sample_45__input_buffer[i+__xlx_offset_param_real_sample_45];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_45; ++i) {
    ((char*)__xlx_apatb_param_real_sample_45)[i*4+0] = __xlx_real_sample_45_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_45)[i*4+1] = __xlx_real_sample_45_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_45)[i*4+2] = __xlx_real_sample_45_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_45)[i*4+3] = __xlx_real_sample_45_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_46
  sc_bv<32>*__xlx_real_sample_46_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_46];
  for (int i = 0; i < __xlx_size_param_real_sample_46; ++i) {
    __xlx_real_sample_46_output_buffer[i] = __xlx_real_sample_46__input_buffer[i+__xlx_offset_param_real_sample_46];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_46; ++i) {
    ((char*)__xlx_apatb_param_real_sample_46)[i*4+0] = __xlx_real_sample_46_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_46)[i*4+1] = __xlx_real_sample_46_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_46)[i*4+2] = __xlx_real_sample_46_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_46)[i*4+3] = __xlx_real_sample_46_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_47
  sc_bv<32>*__xlx_real_sample_47_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_47];
  for (int i = 0; i < __xlx_size_param_real_sample_47; ++i) {
    __xlx_real_sample_47_output_buffer[i] = __xlx_real_sample_47__input_buffer[i+__xlx_offset_param_real_sample_47];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_47; ++i) {
    ((char*)__xlx_apatb_param_real_sample_47)[i*4+0] = __xlx_real_sample_47_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_47)[i*4+1] = __xlx_real_sample_47_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_47)[i*4+2] = __xlx_real_sample_47_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_47)[i*4+3] = __xlx_real_sample_47_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_48
  sc_bv<32>*__xlx_real_sample_48_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_48];
  for (int i = 0; i < __xlx_size_param_real_sample_48; ++i) {
    __xlx_real_sample_48_output_buffer[i] = __xlx_real_sample_48__input_buffer[i+__xlx_offset_param_real_sample_48];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_48; ++i) {
    ((char*)__xlx_apatb_param_real_sample_48)[i*4+0] = __xlx_real_sample_48_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_48)[i*4+1] = __xlx_real_sample_48_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_48)[i*4+2] = __xlx_real_sample_48_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_48)[i*4+3] = __xlx_real_sample_48_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_49
  sc_bv<32>*__xlx_real_sample_49_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_49];
  for (int i = 0; i < __xlx_size_param_real_sample_49; ++i) {
    __xlx_real_sample_49_output_buffer[i] = __xlx_real_sample_49__input_buffer[i+__xlx_offset_param_real_sample_49];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_49; ++i) {
    ((char*)__xlx_apatb_param_real_sample_49)[i*4+0] = __xlx_real_sample_49_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_49)[i*4+1] = __xlx_real_sample_49_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_49)[i*4+2] = __xlx_real_sample_49_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_49)[i*4+3] = __xlx_real_sample_49_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_50
  sc_bv<32>*__xlx_real_sample_50_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_50];
  for (int i = 0; i < __xlx_size_param_real_sample_50; ++i) {
    __xlx_real_sample_50_output_buffer[i] = __xlx_real_sample_50__input_buffer[i+__xlx_offset_param_real_sample_50];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_50; ++i) {
    ((char*)__xlx_apatb_param_real_sample_50)[i*4+0] = __xlx_real_sample_50_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_50)[i*4+1] = __xlx_real_sample_50_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_50)[i*4+2] = __xlx_real_sample_50_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_50)[i*4+3] = __xlx_real_sample_50_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_51
  sc_bv<32>*__xlx_real_sample_51_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_51];
  for (int i = 0; i < __xlx_size_param_real_sample_51; ++i) {
    __xlx_real_sample_51_output_buffer[i] = __xlx_real_sample_51__input_buffer[i+__xlx_offset_param_real_sample_51];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_51; ++i) {
    ((char*)__xlx_apatb_param_real_sample_51)[i*4+0] = __xlx_real_sample_51_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_51)[i*4+1] = __xlx_real_sample_51_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_51)[i*4+2] = __xlx_real_sample_51_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_51)[i*4+3] = __xlx_real_sample_51_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_52
  sc_bv<32>*__xlx_real_sample_52_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_52];
  for (int i = 0; i < __xlx_size_param_real_sample_52; ++i) {
    __xlx_real_sample_52_output_buffer[i] = __xlx_real_sample_52__input_buffer[i+__xlx_offset_param_real_sample_52];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_52; ++i) {
    ((char*)__xlx_apatb_param_real_sample_52)[i*4+0] = __xlx_real_sample_52_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_52)[i*4+1] = __xlx_real_sample_52_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_52)[i*4+2] = __xlx_real_sample_52_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_52)[i*4+3] = __xlx_real_sample_52_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_53
  sc_bv<32>*__xlx_real_sample_53_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_53];
  for (int i = 0; i < __xlx_size_param_real_sample_53; ++i) {
    __xlx_real_sample_53_output_buffer[i] = __xlx_real_sample_53__input_buffer[i+__xlx_offset_param_real_sample_53];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_53; ++i) {
    ((char*)__xlx_apatb_param_real_sample_53)[i*4+0] = __xlx_real_sample_53_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_53)[i*4+1] = __xlx_real_sample_53_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_53)[i*4+2] = __xlx_real_sample_53_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_53)[i*4+3] = __xlx_real_sample_53_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_54
  sc_bv<32>*__xlx_real_sample_54_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_54];
  for (int i = 0; i < __xlx_size_param_real_sample_54; ++i) {
    __xlx_real_sample_54_output_buffer[i] = __xlx_real_sample_54__input_buffer[i+__xlx_offset_param_real_sample_54];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_54; ++i) {
    ((char*)__xlx_apatb_param_real_sample_54)[i*4+0] = __xlx_real_sample_54_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_54)[i*4+1] = __xlx_real_sample_54_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_54)[i*4+2] = __xlx_real_sample_54_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_54)[i*4+3] = __xlx_real_sample_54_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_55
  sc_bv<32>*__xlx_real_sample_55_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_55];
  for (int i = 0; i < __xlx_size_param_real_sample_55; ++i) {
    __xlx_real_sample_55_output_buffer[i] = __xlx_real_sample_55__input_buffer[i+__xlx_offset_param_real_sample_55];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_55; ++i) {
    ((char*)__xlx_apatb_param_real_sample_55)[i*4+0] = __xlx_real_sample_55_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_55)[i*4+1] = __xlx_real_sample_55_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_55)[i*4+2] = __xlx_real_sample_55_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_55)[i*4+3] = __xlx_real_sample_55_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_56
  sc_bv<32>*__xlx_real_sample_56_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_56];
  for (int i = 0; i < __xlx_size_param_real_sample_56; ++i) {
    __xlx_real_sample_56_output_buffer[i] = __xlx_real_sample_56__input_buffer[i+__xlx_offset_param_real_sample_56];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_56; ++i) {
    ((char*)__xlx_apatb_param_real_sample_56)[i*4+0] = __xlx_real_sample_56_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_56)[i*4+1] = __xlx_real_sample_56_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_56)[i*4+2] = __xlx_real_sample_56_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_56)[i*4+3] = __xlx_real_sample_56_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_57
  sc_bv<32>*__xlx_real_sample_57_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_57];
  for (int i = 0; i < __xlx_size_param_real_sample_57; ++i) {
    __xlx_real_sample_57_output_buffer[i] = __xlx_real_sample_57__input_buffer[i+__xlx_offset_param_real_sample_57];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_57; ++i) {
    ((char*)__xlx_apatb_param_real_sample_57)[i*4+0] = __xlx_real_sample_57_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_57)[i*4+1] = __xlx_real_sample_57_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_57)[i*4+2] = __xlx_real_sample_57_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_57)[i*4+3] = __xlx_real_sample_57_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_58
  sc_bv<32>*__xlx_real_sample_58_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_58];
  for (int i = 0; i < __xlx_size_param_real_sample_58; ++i) {
    __xlx_real_sample_58_output_buffer[i] = __xlx_real_sample_58__input_buffer[i+__xlx_offset_param_real_sample_58];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_58; ++i) {
    ((char*)__xlx_apatb_param_real_sample_58)[i*4+0] = __xlx_real_sample_58_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_58)[i*4+1] = __xlx_real_sample_58_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_58)[i*4+2] = __xlx_real_sample_58_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_58)[i*4+3] = __xlx_real_sample_58_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_59
  sc_bv<32>*__xlx_real_sample_59_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_59];
  for (int i = 0; i < __xlx_size_param_real_sample_59; ++i) {
    __xlx_real_sample_59_output_buffer[i] = __xlx_real_sample_59__input_buffer[i+__xlx_offset_param_real_sample_59];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_59; ++i) {
    ((char*)__xlx_apatb_param_real_sample_59)[i*4+0] = __xlx_real_sample_59_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_59)[i*4+1] = __xlx_real_sample_59_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_59)[i*4+2] = __xlx_real_sample_59_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_59)[i*4+3] = __xlx_real_sample_59_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_60
  sc_bv<32>*__xlx_real_sample_60_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_60];
  for (int i = 0; i < __xlx_size_param_real_sample_60; ++i) {
    __xlx_real_sample_60_output_buffer[i] = __xlx_real_sample_60__input_buffer[i+__xlx_offset_param_real_sample_60];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_60; ++i) {
    ((char*)__xlx_apatb_param_real_sample_60)[i*4+0] = __xlx_real_sample_60_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_60)[i*4+1] = __xlx_real_sample_60_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_60)[i*4+2] = __xlx_real_sample_60_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_60)[i*4+3] = __xlx_real_sample_60_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_61
  sc_bv<32>*__xlx_real_sample_61_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_61];
  for (int i = 0; i < __xlx_size_param_real_sample_61; ++i) {
    __xlx_real_sample_61_output_buffer[i] = __xlx_real_sample_61__input_buffer[i+__xlx_offset_param_real_sample_61];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_61; ++i) {
    ((char*)__xlx_apatb_param_real_sample_61)[i*4+0] = __xlx_real_sample_61_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_61)[i*4+1] = __xlx_real_sample_61_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_61)[i*4+2] = __xlx_real_sample_61_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_61)[i*4+3] = __xlx_real_sample_61_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_62
  sc_bv<32>*__xlx_real_sample_62_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_62];
  for (int i = 0; i < __xlx_size_param_real_sample_62; ++i) {
    __xlx_real_sample_62_output_buffer[i] = __xlx_real_sample_62__input_buffer[i+__xlx_offset_param_real_sample_62];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_62; ++i) {
    ((char*)__xlx_apatb_param_real_sample_62)[i*4+0] = __xlx_real_sample_62_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_62)[i*4+1] = __xlx_real_sample_62_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_62)[i*4+2] = __xlx_real_sample_62_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_62)[i*4+3] = __xlx_real_sample_62_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_sample_63
  sc_bv<32>*__xlx_real_sample_63_output_buffer = new sc_bv<32>[__xlx_size_param_real_sample_63];
  for (int i = 0; i < __xlx_size_param_real_sample_63; ++i) {
    __xlx_real_sample_63_output_buffer[i] = __xlx_real_sample_63__input_buffer[i+__xlx_offset_param_real_sample_63];
  }
  for (int i = 0; i < __xlx_size_param_real_sample_63; ++i) {
    ((char*)__xlx_apatb_param_real_sample_63)[i*4+0] = __xlx_real_sample_63_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_sample_63)[i*4+1] = __xlx_real_sample_63_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_sample_63)[i*4+2] = __xlx_real_sample_63_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_sample_63)[i*4+3] = __xlx_real_sample_63_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_0
  sc_bv<32>*__xlx_imag_sample_0_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_0];
  for (int i = 0; i < __xlx_size_param_imag_sample_0; ++i) {
    __xlx_imag_sample_0_output_buffer[i] = __xlx_imag_sample_0__input_buffer[i+__xlx_offset_param_imag_sample_0];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_0; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_0)[i*4+0] = __xlx_imag_sample_0_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_0)[i*4+1] = __xlx_imag_sample_0_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_0)[i*4+2] = __xlx_imag_sample_0_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_0)[i*4+3] = __xlx_imag_sample_0_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_1
  sc_bv<32>*__xlx_imag_sample_1_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_1];
  for (int i = 0; i < __xlx_size_param_imag_sample_1; ++i) {
    __xlx_imag_sample_1_output_buffer[i] = __xlx_imag_sample_1__input_buffer[i+__xlx_offset_param_imag_sample_1];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_1; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_1)[i*4+0] = __xlx_imag_sample_1_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_1)[i*4+1] = __xlx_imag_sample_1_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_1)[i*4+2] = __xlx_imag_sample_1_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_1)[i*4+3] = __xlx_imag_sample_1_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_2
  sc_bv<32>*__xlx_imag_sample_2_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_2];
  for (int i = 0; i < __xlx_size_param_imag_sample_2; ++i) {
    __xlx_imag_sample_2_output_buffer[i] = __xlx_imag_sample_2__input_buffer[i+__xlx_offset_param_imag_sample_2];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_2; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_2)[i*4+0] = __xlx_imag_sample_2_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_2)[i*4+1] = __xlx_imag_sample_2_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_2)[i*4+2] = __xlx_imag_sample_2_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_2)[i*4+3] = __xlx_imag_sample_2_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_3
  sc_bv<32>*__xlx_imag_sample_3_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_3];
  for (int i = 0; i < __xlx_size_param_imag_sample_3; ++i) {
    __xlx_imag_sample_3_output_buffer[i] = __xlx_imag_sample_3__input_buffer[i+__xlx_offset_param_imag_sample_3];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_3; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_3)[i*4+0] = __xlx_imag_sample_3_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_3)[i*4+1] = __xlx_imag_sample_3_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_3)[i*4+2] = __xlx_imag_sample_3_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_3)[i*4+3] = __xlx_imag_sample_3_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_4
  sc_bv<32>*__xlx_imag_sample_4_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_4];
  for (int i = 0; i < __xlx_size_param_imag_sample_4; ++i) {
    __xlx_imag_sample_4_output_buffer[i] = __xlx_imag_sample_4__input_buffer[i+__xlx_offset_param_imag_sample_4];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_4; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_4)[i*4+0] = __xlx_imag_sample_4_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_4)[i*4+1] = __xlx_imag_sample_4_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_4)[i*4+2] = __xlx_imag_sample_4_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_4)[i*4+3] = __xlx_imag_sample_4_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_5
  sc_bv<32>*__xlx_imag_sample_5_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_5];
  for (int i = 0; i < __xlx_size_param_imag_sample_5; ++i) {
    __xlx_imag_sample_5_output_buffer[i] = __xlx_imag_sample_5__input_buffer[i+__xlx_offset_param_imag_sample_5];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_5; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_5)[i*4+0] = __xlx_imag_sample_5_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_5)[i*4+1] = __xlx_imag_sample_5_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_5)[i*4+2] = __xlx_imag_sample_5_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_5)[i*4+3] = __xlx_imag_sample_5_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_6
  sc_bv<32>*__xlx_imag_sample_6_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_6];
  for (int i = 0; i < __xlx_size_param_imag_sample_6; ++i) {
    __xlx_imag_sample_6_output_buffer[i] = __xlx_imag_sample_6__input_buffer[i+__xlx_offset_param_imag_sample_6];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_6; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_6)[i*4+0] = __xlx_imag_sample_6_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_6)[i*4+1] = __xlx_imag_sample_6_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_6)[i*4+2] = __xlx_imag_sample_6_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_6)[i*4+3] = __xlx_imag_sample_6_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_7
  sc_bv<32>*__xlx_imag_sample_7_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_7];
  for (int i = 0; i < __xlx_size_param_imag_sample_7; ++i) {
    __xlx_imag_sample_7_output_buffer[i] = __xlx_imag_sample_7__input_buffer[i+__xlx_offset_param_imag_sample_7];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_7; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_7)[i*4+0] = __xlx_imag_sample_7_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_7)[i*4+1] = __xlx_imag_sample_7_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_7)[i*4+2] = __xlx_imag_sample_7_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_7)[i*4+3] = __xlx_imag_sample_7_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_8
  sc_bv<32>*__xlx_imag_sample_8_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_8];
  for (int i = 0; i < __xlx_size_param_imag_sample_8; ++i) {
    __xlx_imag_sample_8_output_buffer[i] = __xlx_imag_sample_8__input_buffer[i+__xlx_offset_param_imag_sample_8];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_8; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_8)[i*4+0] = __xlx_imag_sample_8_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_8)[i*4+1] = __xlx_imag_sample_8_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_8)[i*4+2] = __xlx_imag_sample_8_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_8)[i*4+3] = __xlx_imag_sample_8_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_9
  sc_bv<32>*__xlx_imag_sample_9_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_9];
  for (int i = 0; i < __xlx_size_param_imag_sample_9; ++i) {
    __xlx_imag_sample_9_output_buffer[i] = __xlx_imag_sample_9__input_buffer[i+__xlx_offset_param_imag_sample_9];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_9; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_9)[i*4+0] = __xlx_imag_sample_9_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_9)[i*4+1] = __xlx_imag_sample_9_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_9)[i*4+2] = __xlx_imag_sample_9_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_9)[i*4+3] = __xlx_imag_sample_9_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_10
  sc_bv<32>*__xlx_imag_sample_10_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_10];
  for (int i = 0; i < __xlx_size_param_imag_sample_10; ++i) {
    __xlx_imag_sample_10_output_buffer[i] = __xlx_imag_sample_10__input_buffer[i+__xlx_offset_param_imag_sample_10];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_10; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_10)[i*4+0] = __xlx_imag_sample_10_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_10)[i*4+1] = __xlx_imag_sample_10_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_10)[i*4+2] = __xlx_imag_sample_10_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_10)[i*4+3] = __xlx_imag_sample_10_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_11
  sc_bv<32>*__xlx_imag_sample_11_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_11];
  for (int i = 0; i < __xlx_size_param_imag_sample_11; ++i) {
    __xlx_imag_sample_11_output_buffer[i] = __xlx_imag_sample_11__input_buffer[i+__xlx_offset_param_imag_sample_11];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_11; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_11)[i*4+0] = __xlx_imag_sample_11_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_11)[i*4+1] = __xlx_imag_sample_11_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_11)[i*4+2] = __xlx_imag_sample_11_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_11)[i*4+3] = __xlx_imag_sample_11_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_12
  sc_bv<32>*__xlx_imag_sample_12_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_12];
  for (int i = 0; i < __xlx_size_param_imag_sample_12; ++i) {
    __xlx_imag_sample_12_output_buffer[i] = __xlx_imag_sample_12__input_buffer[i+__xlx_offset_param_imag_sample_12];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_12; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_12)[i*4+0] = __xlx_imag_sample_12_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_12)[i*4+1] = __xlx_imag_sample_12_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_12)[i*4+2] = __xlx_imag_sample_12_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_12)[i*4+3] = __xlx_imag_sample_12_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_13
  sc_bv<32>*__xlx_imag_sample_13_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_13];
  for (int i = 0; i < __xlx_size_param_imag_sample_13; ++i) {
    __xlx_imag_sample_13_output_buffer[i] = __xlx_imag_sample_13__input_buffer[i+__xlx_offset_param_imag_sample_13];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_13; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_13)[i*4+0] = __xlx_imag_sample_13_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_13)[i*4+1] = __xlx_imag_sample_13_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_13)[i*4+2] = __xlx_imag_sample_13_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_13)[i*4+3] = __xlx_imag_sample_13_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_14
  sc_bv<32>*__xlx_imag_sample_14_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_14];
  for (int i = 0; i < __xlx_size_param_imag_sample_14; ++i) {
    __xlx_imag_sample_14_output_buffer[i] = __xlx_imag_sample_14__input_buffer[i+__xlx_offset_param_imag_sample_14];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_14; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_14)[i*4+0] = __xlx_imag_sample_14_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_14)[i*4+1] = __xlx_imag_sample_14_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_14)[i*4+2] = __xlx_imag_sample_14_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_14)[i*4+3] = __xlx_imag_sample_14_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_15
  sc_bv<32>*__xlx_imag_sample_15_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_15];
  for (int i = 0; i < __xlx_size_param_imag_sample_15; ++i) {
    __xlx_imag_sample_15_output_buffer[i] = __xlx_imag_sample_15__input_buffer[i+__xlx_offset_param_imag_sample_15];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_15; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_15)[i*4+0] = __xlx_imag_sample_15_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_15)[i*4+1] = __xlx_imag_sample_15_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_15)[i*4+2] = __xlx_imag_sample_15_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_15)[i*4+3] = __xlx_imag_sample_15_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_16
  sc_bv<32>*__xlx_imag_sample_16_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_16];
  for (int i = 0; i < __xlx_size_param_imag_sample_16; ++i) {
    __xlx_imag_sample_16_output_buffer[i] = __xlx_imag_sample_16__input_buffer[i+__xlx_offset_param_imag_sample_16];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_16; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_16)[i*4+0] = __xlx_imag_sample_16_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_16)[i*4+1] = __xlx_imag_sample_16_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_16)[i*4+2] = __xlx_imag_sample_16_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_16)[i*4+3] = __xlx_imag_sample_16_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_17
  sc_bv<32>*__xlx_imag_sample_17_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_17];
  for (int i = 0; i < __xlx_size_param_imag_sample_17; ++i) {
    __xlx_imag_sample_17_output_buffer[i] = __xlx_imag_sample_17__input_buffer[i+__xlx_offset_param_imag_sample_17];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_17; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_17)[i*4+0] = __xlx_imag_sample_17_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_17)[i*4+1] = __xlx_imag_sample_17_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_17)[i*4+2] = __xlx_imag_sample_17_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_17)[i*4+3] = __xlx_imag_sample_17_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_18
  sc_bv<32>*__xlx_imag_sample_18_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_18];
  for (int i = 0; i < __xlx_size_param_imag_sample_18; ++i) {
    __xlx_imag_sample_18_output_buffer[i] = __xlx_imag_sample_18__input_buffer[i+__xlx_offset_param_imag_sample_18];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_18; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_18)[i*4+0] = __xlx_imag_sample_18_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_18)[i*4+1] = __xlx_imag_sample_18_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_18)[i*4+2] = __xlx_imag_sample_18_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_18)[i*4+3] = __xlx_imag_sample_18_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_19
  sc_bv<32>*__xlx_imag_sample_19_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_19];
  for (int i = 0; i < __xlx_size_param_imag_sample_19; ++i) {
    __xlx_imag_sample_19_output_buffer[i] = __xlx_imag_sample_19__input_buffer[i+__xlx_offset_param_imag_sample_19];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_19; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_19)[i*4+0] = __xlx_imag_sample_19_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_19)[i*4+1] = __xlx_imag_sample_19_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_19)[i*4+2] = __xlx_imag_sample_19_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_19)[i*4+3] = __xlx_imag_sample_19_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_20
  sc_bv<32>*__xlx_imag_sample_20_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_20];
  for (int i = 0; i < __xlx_size_param_imag_sample_20; ++i) {
    __xlx_imag_sample_20_output_buffer[i] = __xlx_imag_sample_20__input_buffer[i+__xlx_offset_param_imag_sample_20];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_20; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_20)[i*4+0] = __xlx_imag_sample_20_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_20)[i*4+1] = __xlx_imag_sample_20_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_20)[i*4+2] = __xlx_imag_sample_20_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_20)[i*4+3] = __xlx_imag_sample_20_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_21
  sc_bv<32>*__xlx_imag_sample_21_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_21];
  for (int i = 0; i < __xlx_size_param_imag_sample_21; ++i) {
    __xlx_imag_sample_21_output_buffer[i] = __xlx_imag_sample_21__input_buffer[i+__xlx_offset_param_imag_sample_21];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_21; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_21)[i*4+0] = __xlx_imag_sample_21_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_21)[i*4+1] = __xlx_imag_sample_21_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_21)[i*4+2] = __xlx_imag_sample_21_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_21)[i*4+3] = __xlx_imag_sample_21_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_22
  sc_bv<32>*__xlx_imag_sample_22_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_22];
  for (int i = 0; i < __xlx_size_param_imag_sample_22; ++i) {
    __xlx_imag_sample_22_output_buffer[i] = __xlx_imag_sample_22__input_buffer[i+__xlx_offset_param_imag_sample_22];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_22; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_22)[i*4+0] = __xlx_imag_sample_22_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_22)[i*4+1] = __xlx_imag_sample_22_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_22)[i*4+2] = __xlx_imag_sample_22_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_22)[i*4+3] = __xlx_imag_sample_22_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_23
  sc_bv<32>*__xlx_imag_sample_23_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_23];
  for (int i = 0; i < __xlx_size_param_imag_sample_23; ++i) {
    __xlx_imag_sample_23_output_buffer[i] = __xlx_imag_sample_23__input_buffer[i+__xlx_offset_param_imag_sample_23];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_23; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_23)[i*4+0] = __xlx_imag_sample_23_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_23)[i*4+1] = __xlx_imag_sample_23_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_23)[i*4+2] = __xlx_imag_sample_23_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_23)[i*4+3] = __xlx_imag_sample_23_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_24
  sc_bv<32>*__xlx_imag_sample_24_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_24];
  for (int i = 0; i < __xlx_size_param_imag_sample_24; ++i) {
    __xlx_imag_sample_24_output_buffer[i] = __xlx_imag_sample_24__input_buffer[i+__xlx_offset_param_imag_sample_24];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_24; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_24)[i*4+0] = __xlx_imag_sample_24_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_24)[i*4+1] = __xlx_imag_sample_24_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_24)[i*4+2] = __xlx_imag_sample_24_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_24)[i*4+3] = __xlx_imag_sample_24_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_25
  sc_bv<32>*__xlx_imag_sample_25_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_25];
  for (int i = 0; i < __xlx_size_param_imag_sample_25; ++i) {
    __xlx_imag_sample_25_output_buffer[i] = __xlx_imag_sample_25__input_buffer[i+__xlx_offset_param_imag_sample_25];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_25; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_25)[i*4+0] = __xlx_imag_sample_25_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_25)[i*4+1] = __xlx_imag_sample_25_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_25)[i*4+2] = __xlx_imag_sample_25_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_25)[i*4+3] = __xlx_imag_sample_25_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_26
  sc_bv<32>*__xlx_imag_sample_26_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_26];
  for (int i = 0; i < __xlx_size_param_imag_sample_26; ++i) {
    __xlx_imag_sample_26_output_buffer[i] = __xlx_imag_sample_26__input_buffer[i+__xlx_offset_param_imag_sample_26];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_26; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_26)[i*4+0] = __xlx_imag_sample_26_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_26)[i*4+1] = __xlx_imag_sample_26_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_26)[i*4+2] = __xlx_imag_sample_26_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_26)[i*4+3] = __xlx_imag_sample_26_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_27
  sc_bv<32>*__xlx_imag_sample_27_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_27];
  for (int i = 0; i < __xlx_size_param_imag_sample_27; ++i) {
    __xlx_imag_sample_27_output_buffer[i] = __xlx_imag_sample_27__input_buffer[i+__xlx_offset_param_imag_sample_27];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_27; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_27)[i*4+0] = __xlx_imag_sample_27_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_27)[i*4+1] = __xlx_imag_sample_27_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_27)[i*4+2] = __xlx_imag_sample_27_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_27)[i*4+3] = __xlx_imag_sample_27_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_28
  sc_bv<32>*__xlx_imag_sample_28_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_28];
  for (int i = 0; i < __xlx_size_param_imag_sample_28; ++i) {
    __xlx_imag_sample_28_output_buffer[i] = __xlx_imag_sample_28__input_buffer[i+__xlx_offset_param_imag_sample_28];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_28; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_28)[i*4+0] = __xlx_imag_sample_28_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_28)[i*4+1] = __xlx_imag_sample_28_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_28)[i*4+2] = __xlx_imag_sample_28_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_28)[i*4+3] = __xlx_imag_sample_28_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_29
  sc_bv<32>*__xlx_imag_sample_29_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_29];
  for (int i = 0; i < __xlx_size_param_imag_sample_29; ++i) {
    __xlx_imag_sample_29_output_buffer[i] = __xlx_imag_sample_29__input_buffer[i+__xlx_offset_param_imag_sample_29];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_29; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_29)[i*4+0] = __xlx_imag_sample_29_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_29)[i*4+1] = __xlx_imag_sample_29_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_29)[i*4+2] = __xlx_imag_sample_29_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_29)[i*4+3] = __xlx_imag_sample_29_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_30
  sc_bv<32>*__xlx_imag_sample_30_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_30];
  for (int i = 0; i < __xlx_size_param_imag_sample_30; ++i) {
    __xlx_imag_sample_30_output_buffer[i] = __xlx_imag_sample_30__input_buffer[i+__xlx_offset_param_imag_sample_30];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_30; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_30)[i*4+0] = __xlx_imag_sample_30_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_30)[i*4+1] = __xlx_imag_sample_30_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_30)[i*4+2] = __xlx_imag_sample_30_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_30)[i*4+3] = __xlx_imag_sample_30_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_31
  sc_bv<32>*__xlx_imag_sample_31_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_31];
  for (int i = 0; i < __xlx_size_param_imag_sample_31; ++i) {
    __xlx_imag_sample_31_output_buffer[i] = __xlx_imag_sample_31__input_buffer[i+__xlx_offset_param_imag_sample_31];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_31; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_31)[i*4+0] = __xlx_imag_sample_31_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_31)[i*4+1] = __xlx_imag_sample_31_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_31)[i*4+2] = __xlx_imag_sample_31_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_31)[i*4+3] = __xlx_imag_sample_31_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_32
  sc_bv<32>*__xlx_imag_sample_32_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_32];
  for (int i = 0; i < __xlx_size_param_imag_sample_32; ++i) {
    __xlx_imag_sample_32_output_buffer[i] = __xlx_imag_sample_32__input_buffer[i+__xlx_offset_param_imag_sample_32];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_32; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_32)[i*4+0] = __xlx_imag_sample_32_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_32)[i*4+1] = __xlx_imag_sample_32_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_32)[i*4+2] = __xlx_imag_sample_32_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_32)[i*4+3] = __xlx_imag_sample_32_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_33
  sc_bv<32>*__xlx_imag_sample_33_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_33];
  for (int i = 0; i < __xlx_size_param_imag_sample_33; ++i) {
    __xlx_imag_sample_33_output_buffer[i] = __xlx_imag_sample_33__input_buffer[i+__xlx_offset_param_imag_sample_33];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_33; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_33)[i*4+0] = __xlx_imag_sample_33_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_33)[i*4+1] = __xlx_imag_sample_33_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_33)[i*4+2] = __xlx_imag_sample_33_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_33)[i*4+3] = __xlx_imag_sample_33_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_34
  sc_bv<32>*__xlx_imag_sample_34_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_34];
  for (int i = 0; i < __xlx_size_param_imag_sample_34; ++i) {
    __xlx_imag_sample_34_output_buffer[i] = __xlx_imag_sample_34__input_buffer[i+__xlx_offset_param_imag_sample_34];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_34; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_34)[i*4+0] = __xlx_imag_sample_34_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_34)[i*4+1] = __xlx_imag_sample_34_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_34)[i*4+2] = __xlx_imag_sample_34_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_34)[i*4+3] = __xlx_imag_sample_34_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_35
  sc_bv<32>*__xlx_imag_sample_35_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_35];
  for (int i = 0; i < __xlx_size_param_imag_sample_35; ++i) {
    __xlx_imag_sample_35_output_buffer[i] = __xlx_imag_sample_35__input_buffer[i+__xlx_offset_param_imag_sample_35];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_35; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_35)[i*4+0] = __xlx_imag_sample_35_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_35)[i*4+1] = __xlx_imag_sample_35_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_35)[i*4+2] = __xlx_imag_sample_35_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_35)[i*4+3] = __xlx_imag_sample_35_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_36
  sc_bv<32>*__xlx_imag_sample_36_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_36];
  for (int i = 0; i < __xlx_size_param_imag_sample_36; ++i) {
    __xlx_imag_sample_36_output_buffer[i] = __xlx_imag_sample_36__input_buffer[i+__xlx_offset_param_imag_sample_36];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_36; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_36)[i*4+0] = __xlx_imag_sample_36_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_36)[i*4+1] = __xlx_imag_sample_36_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_36)[i*4+2] = __xlx_imag_sample_36_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_36)[i*4+3] = __xlx_imag_sample_36_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_37
  sc_bv<32>*__xlx_imag_sample_37_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_37];
  for (int i = 0; i < __xlx_size_param_imag_sample_37; ++i) {
    __xlx_imag_sample_37_output_buffer[i] = __xlx_imag_sample_37__input_buffer[i+__xlx_offset_param_imag_sample_37];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_37; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_37)[i*4+0] = __xlx_imag_sample_37_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_37)[i*4+1] = __xlx_imag_sample_37_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_37)[i*4+2] = __xlx_imag_sample_37_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_37)[i*4+3] = __xlx_imag_sample_37_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_38
  sc_bv<32>*__xlx_imag_sample_38_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_38];
  for (int i = 0; i < __xlx_size_param_imag_sample_38; ++i) {
    __xlx_imag_sample_38_output_buffer[i] = __xlx_imag_sample_38__input_buffer[i+__xlx_offset_param_imag_sample_38];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_38; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_38)[i*4+0] = __xlx_imag_sample_38_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_38)[i*4+1] = __xlx_imag_sample_38_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_38)[i*4+2] = __xlx_imag_sample_38_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_38)[i*4+3] = __xlx_imag_sample_38_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_39
  sc_bv<32>*__xlx_imag_sample_39_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_39];
  for (int i = 0; i < __xlx_size_param_imag_sample_39; ++i) {
    __xlx_imag_sample_39_output_buffer[i] = __xlx_imag_sample_39__input_buffer[i+__xlx_offset_param_imag_sample_39];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_39; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_39)[i*4+0] = __xlx_imag_sample_39_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_39)[i*4+1] = __xlx_imag_sample_39_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_39)[i*4+2] = __xlx_imag_sample_39_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_39)[i*4+3] = __xlx_imag_sample_39_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_40
  sc_bv<32>*__xlx_imag_sample_40_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_40];
  for (int i = 0; i < __xlx_size_param_imag_sample_40; ++i) {
    __xlx_imag_sample_40_output_buffer[i] = __xlx_imag_sample_40__input_buffer[i+__xlx_offset_param_imag_sample_40];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_40; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_40)[i*4+0] = __xlx_imag_sample_40_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_40)[i*4+1] = __xlx_imag_sample_40_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_40)[i*4+2] = __xlx_imag_sample_40_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_40)[i*4+3] = __xlx_imag_sample_40_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_41
  sc_bv<32>*__xlx_imag_sample_41_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_41];
  for (int i = 0; i < __xlx_size_param_imag_sample_41; ++i) {
    __xlx_imag_sample_41_output_buffer[i] = __xlx_imag_sample_41__input_buffer[i+__xlx_offset_param_imag_sample_41];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_41; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_41)[i*4+0] = __xlx_imag_sample_41_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_41)[i*4+1] = __xlx_imag_sample_41_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_41)[i*4+2] = __xlx_imag_sample_41_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_41)[i*4+3] = __xlx_imag_sample_41_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_42
  sc_bv<32>*__xlx_imag_sample_42_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_42];
  for (int i = 0; i < __xlx_size_param_imag_sample_42; ++i) {
    __xlx_imag_sample_42_output_buffer[i] = __xlx_imag_sample_42__input_buffer[i+__xlx_offset_param_imag_sample_42];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_42; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_42)[i*4+0] = __xlx_imag_sample_42_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_42)[i*4+1] = __xlx_imag_sample_42_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_42)[i*4+2] = __xlx_imag_sample_42_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_42)[i*4+3] = __xlx_imag_sample_42_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_43
  sc_bv<32>*__xlx_imag_sample_43_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_43];
  for (int i = 0; i < __xlx_size_param_imag_sample_43; ++i) {
    __xlx_imag_sample_43_output_buffer[i] = __xlx_imag_sample_43__input_buffer[i+__xlx_offset_param_imag_sample_43];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_43; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_43)[i*4+0] = __xlx_imag_sample_43_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_43)[i*4+1] = __xlx_imag_sample_43_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_43)[i*4+2] = __xlx_imag_sample_43_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_43)[i*4+3] = __xlx_imag_sample_43_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_44
  sc_bv<32>*__xlx_imag_sample_44_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_44];
  for (int i = 0; i < __xlx_size_param_imag_sample_44; ++i) {
    __xlx_imag_sample_44_output_buffer[i] = __xlx_imag_sample_44__input_buffer[i+__xlx_offset_param_imag_sample_44];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_44; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_44)[i*4+0] = __xlx_imag_sample_44_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_44)[i*4+1] = __xlx_imag_sample_44_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_44)[i*4+2] = __xlx_imag_sample_44_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_44)[i*4+3] = __xlx_imag_sample_44_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_45
  sc_bv<32>*__xlx_imag_sample_45_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_45];
  for (int i = 0; i < __xlx_size_param_imag_sample_45; ++i) {
    __xlx_imag_sample_45_output_buffer[i] = __xlx_imag_sample_45__input_buffer[i+__xlx_offset_param_imag_sample_45];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_45; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_45)[i*4+0] = __xlx_imag_sample_45_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_45)[i*4+1] = __xlx_imag_sample_45_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_45)[i*4+2] = __xlx_imag_sample_45_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_45)[i*4+3] = __xlx_imag_sample_45_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_46
  sc_bv<32>*__xlx_imag_sample_46_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_46];
  for (int i = 0; i < __xlx_size_param_imag_sample_46; ++i) {
    __xlx_imag_sample_46_output_buffer[i] = __xlx_imag_sample_46__input_buffer[i+__xlx_offset_param_imag_sample_46];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_46; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_46)[i*4+0] = __xlx_imag_sample_46_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_46)[i*4+1] = __xlx_imag_sample_46_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_46)[i*4+2] = __xlx_imag_sample_46_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_46)[i*4+3] = __xlx_imag_sample_46_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_47
  sc_bv<32>*__xlx_imag_sample_47_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_47];
  for (int i = 0; i < __xlx_size_param_imag_sample_47; ++i) {
    __xlx_imag_sample_47_output_buffer[i] = __xlx_imag_sample_47__input_buffer[i+__xlx_offset_param_imag_sample_47];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_47; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_47)[i*4+0] = __xlx_imag_sample_47_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_47)[i*4+1] = __xlx_imag_sample_47_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_47)[i*4+2] = __xlx_imag_sample_47_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_47)[i*4+3] = __xlx_imag_sample_47_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_48
  sc_bv<32>*__xlx_imag_sample_48_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_48];
  for (int i = 0; i < __xlx_size_param_imag_sample_48; ++i) {
    __xlx_imag_sample_48_output_buffer[i] = __xlx_imag_sample_48__input_buffer[i+__xlx_offset_param_imag_sample_48];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_48; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_48)[i*4+0] = __xlx_imag_sample_48_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_48)[i*4+1] = __xlx_imag_sample_48_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_48)[i*4+2] = __xlx_imag_sample_48_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_48)[i*4+3] = __xlx_imag_sample_48_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_49
  sc_bv<32>*__xlx_imag_sample_49_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_49];
  for (int i = 0; i < __xlx_size_param_imag_sample_49; ++i) {
    __xlx_imag_sample_49_output_buffer[i] = __xlx_imag_sample_49__input_buffer[i+__xlx_offset_param_imag_sample_49];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_49; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_49)[i*4+0] = __xlx_imag_sample_49_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_49)[i*4+1] = __xlx_imag_sample_49_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_49)[i*4+2] = __xlx_imag_sample_49_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_49)[i*4+3] = __xlx_imag_sample_49_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_50
  sc_bv<32>*__xlx_imag_sample_50_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_50];
  for (int i = 0; i < __xlx_size_param_imag_sample_50; ++i) {
    __xlx_imag_sample_50_output_buffer[i] = __xlx_imag_sample_50__input_buffer[i+__xlx_offset_param_imag_sample_50];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_50; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_50)[i*4+0] = __xlx_imag_sample_50_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_50)[i*4+1] = __xlx_imag_sample_50_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_50)[i*4+2] = __xlx_imag_sample_50_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_50)[i*4+3] = __xlx_imag_sample_50_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_51
  sc_bv<32>*__xlx_imag_sample_51_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_51];
  for (int i = 0; i < __xlx_size_param_imag_sample_51; ++i) {
    __xlx_imag_sample_51_output_buffer[i] = __xlx_imag_sample_51__input_buffer[i+__xlx_offset_param_imag_sample_51];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_51; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_51)[i*4+0] = __xlx_imag_sample_51_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_51)[i*4+1] = __xlx_imag_sample_51_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_51)[i*4+2] = __xlx_imag_sample_51_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_51)[i*4+3] = __xlx_imag_sample_51_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_52
  sc_bv<32>*__xlx_imag_sample_52_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_52];
  for (int i = 0; i < __xlx_size_param_imag_sample_52; ++i) {
    __xlx_imag_sample_52_output_buffer[i] = __xlx_imag_sample_52__input_buffer[i+__xlx_offset_param_imag_sample_52];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_52; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_52)[i*4+0] = __xlx_imag_sample_52_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_52)[i*4+1] = __xlx_imag_sample_52_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_52)[i*4+2] = __xlx_imag_sample_52_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_52)[i*4+3] = __xlx_imag_sample_52_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_53
  sc_bv<32>*__xlx_imag_sample_53_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_53];
  for (int i = 0; i < __xlx_size_param_imag_sample_53; ++i) {
    __xlx_imag_sample_53_output_buffer[i] = __xlx_imag_sample_53__input_buffer[i+__xlx_offset_param_imag_sample_53];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_53; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_53)[i*4+0] = __xlx_imag_sample_53_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_53)[i*4+1] = __xlx_imag_sample_53_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_53)[i*4+2] = __xlx_imag_sample_53_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_53)[i*4+3] = __xlx_imag_sample_53_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_54
  sc_bv<32>*__xlx_imag_sample_54_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_54];
  for (int i = 0; i < __xlx_size_param_imag_sample_54; ++i) {
    __xlx_imag_sample_54_output_buffer[i] = __xlx_imag_sample_54__input_buffer[i+__xlx_offset_param_imag_sample_54];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_54; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_54)[i*4+0] = __xlx_imag_sample_54_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_54)[i*4+1] = __xlx_imag_sample_54_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_54)[i*4+2] = __xlx_imag_sample_54_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_54)[i*4+3] = __xlx_imag_sample_54_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_55
  sc_bv<32>*__xlx_imag_sample_55_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_55];
  for (int i = 0; i < __xlx_size_param_imag_sample_55; ++i) {
    __xlx_imag_sample_55_output_buffer[i] = __xlx_imag_sample_55__input_buffer[i+__xlx_offset_param_imag_sample_55];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_55; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_55)[i*4+0] = __xlx_imag_sample_55_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_55)[i*4+1] = __xlx_imag_sample_55_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_55)[i*4+2] = __xlx_imag_sample_55_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_55)[i*4+3] = __xlx_imag_sample_55_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_56
  sc_bv<32>*__xlx_imag_sample_56_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_56];
  for (int i = 0; i < __xlx_size_param_imag_sample_56; ++i) {
    __xlx_imag_sample_56_output_buffer[i] = __xlx_imag_sample_56__input_buffer[i+__xlx_offset_param_imag_sample_56];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_56; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_56)[i*4+0] = __xlx_imag_sample_56_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_56)[i*4+1] = __xlx_imag_sample_56_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_56)[i*4+2] = __xlx_imag_sample_56_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_56)[i*4+3] = __xlx_imag_sample_56_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_57
  sc_bv<32>*__xlx_imag_sample_57_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_57];
  for (int i = 0; i < __xlx_size_param_imag_sample_57; ++i) {
    __xlx_imag_sample_57_output_buffer[i] = __xlx_imag_sample_57__input_buffer[i+__xlx_offset_param_imag_sample_57];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_57; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_57)[i*4+0] = __xlx_imag_sample_57_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_57)[i*4+1] = __xlx_imag_sample_57_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_57)[i*4+2] = __xlx_imag_sample_57_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_57)[i*4+3] = __xlx_imag_sample_57_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_58
  sc_bv<32>*__xlx_imag_sample_58_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_58];
  for (int i = 0; i < __xlx_size_param_imag_sample_58; ++i) {
    __xlx_imag_sample_58_output_buffer[i] = __xlx_imag_sample_58__input_buffer[i+__xlx_offset_param_imag_sample_58];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_58; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_58)[i*4+0] = __xlx_imag_sample_58_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_58)[i*4+1] = __xlx_imag_sample_58_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_58)[i*4+2] = __xlx_imag_sample_58_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_58)[i*4+3] = __xlx_imag_sample_58_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_59
  sc_bv<32>*__xlx_imag_sample_59_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_59];
  for (int i = 0; i < __xlx_size_param_imag_sample_59; ++i) {
    __xlx_imag_sample_59_output_buffer[i] = __xlx_imag_sample_59__input_buffer[i+__xlx_offset_param_imag_sample_59];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_59; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_59)[i*4+0] = __xlx_imag_sample_59_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_59)[i*4+1] = __xlx_imag_sample_59_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_59)[i*4+2] = __xlx_imag_sample_59_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_59)[i*4+3] = __xlx_imag_sample_59_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_60
  sc_bv<32>*__xlx_imag_sample_60_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_60];
  for (int i = 0; i < __xlx_size_param_imag_sample_60; ++i) {
    __xlx_imag_sample_60_output_buffer[i] = __xlx_imag_sample_60__input_buffer[i+__xlx_offset_param_imag_sample_60];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_60; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_60)[i*4+0] = __xlx_imag_sample_60_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_60)[i*4+1] = __xlx_imag_sample_60_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_60)[i*4+2] = __xlx_imag_sample_60_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_60)[i*4+3] = __xlx_imag_sample_60_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_61
  sc_bv<32>*__xlx_imag_sample_61_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_61];
  for (int i = 0; i < __xlx_size_param_imag_sample_61; ++i) {
    __xlx_imag_sample_61_output_buffer[i] = __xlx_imag_sample_61__input_buffer[i+__xlx_offset_param_imag_sample_61];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_61; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_61)[i*4+0] = __xlx_imag_sample_61_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_61)[i*4+1] = __xlx_imag_sample_61_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_61)[i*4+2] = __xlx_imag_sample_61_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_61)[i*4+3] = __xlx_imag_sample_61_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_62
  sc_bv<32>*__xlx_imag_sample_62_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_62];
  for (int i = 0; i < __xlx_size_param_imag_sample_62; ++i) {
    __xlx_imag_sample_62_output_buffer[i] = __xlx_imag_sample_62__input_buffer[i+__xlx_offset_param_imag_sample_62];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_62; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_62)[i*4+0] = __xlx_imag_sample_62_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_62)[i*4+1] = __xlx_imag_sample_62_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_62)[i*4+2] = __xlx_imag_sample_62_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_62)[i*4+3] = __xlx_imag_sample_62_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_sample_63
  sc_bv<32>*__xlx_imag_sample_63_output_buffer = new sc_bv<32>[__xlx_size_param_imag_sample_63];
  for (int i = 0; i < __xlx_size_param_imag_sample_63; ++i) {
    __xlx_imag_sample_63_output_buffer[i] = __xlx_imag_sample_63__input_buffer[i+__xlx_offset_param_imag_sample_63];
  }
  for (int i = 0; i < __xlx_size_param_imag_sample_63; ++i) {
    ((char*)__xlx_apatb_param_imag_sample_63)[i*4+0] = __xlx_imag_sample_63_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_63)[i*4+1] = __xlx_imag_sample_63_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_63)[i*4+2] = __xlx_imag_sample_63_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_sample_63)[i*4+3] = __xlx_imag_sample_63_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_0
  sc_bv<32>*__xlx_real_output_0_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_0];
  for (int i = 0; i < __xlx_size_param_real_output_0; ++i) {
    __xlx_real_output_0_output_buffer[i] = __xlx_real_output_0__input_buffer[i+__xlx_offset_param_real_output_0];
  }
  for (int i = 0; i < __xlx_size_param_real_output_0; ++i) {
    ((char*)__xlx_apatb_param_real_output_0)[i*4+0] = __xlx_real_output_0_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_0)[i*4+1] = __xlx_real_output_0_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_0)[i*4+2] = __xlx_real_output_0_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_0)[i*4+3] = __xlx_real_output_0_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_1
  sc_bv<32>*__xlx_real_output_1_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_1];
  for (int i = 0; i < __xlx_size_param_real_output_1; ++i) {
    __xlx_real_output_1_output_buffer[i] = __xlx_real_output_1__input_buffer[i+__xlx_offset_param_real_output_1];
  }
  for (int i = 0; i < __xlx_size_param_real_output_1; ++i) {
    ((char*)__xlx_apatb_param_real_output_1)[i*4+0] = __xlx_real_output_1_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_1)[i*4+1] = __xlx_real_output_1_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_1)[i*4+2] = __xlx_real_output_1_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_1)[i*4+3] = __xlx_real_output_1_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_2
  sc_bv<32>*__xlx_real_output_2_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_2];
  for (int i = 0; i < __xlx_size_param_real_output_2; ++i) {
    __xlx_real_output_2_output_buffer[i] = __xlx_real_output_2__input_buffer[i+__xlx_offset_param_real_output_2];
  }
  for (int i = 0; i < __xlx_size_param_real_output_2; ++i) {
    ((char*)__xlx_apatb_param_real_output_2)[i*4+0] = __xlx_real_output_2_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_2)[i*4+1] = __xlx_real_output_2_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_2)[i*4+2] = __xlx_real_output_2_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_2)[i*4+3] = __xlx_real_output_2_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_3
  sc_bv<32>*__xlx_real_output_3_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_3];
  for (int i = 0; i < __xlx_size_param_real_output_3; ++i) {
    __xlx_real_output_3_output_buffer[i] = __xlx_real_output_3__input_buffer[i+__xlx_offset_param_real_output_3];
  }
  for (int i = 0; i < __xlx_size_param_real_output_3; ++i) {
    ((char*)__xlx_apatb_param_real_output_3)[i*4+0] = __xlx_real_output_3_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_3)[i*4+1] = __xlx_real_output_3_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_3)[i*4+2] = __xlx_real_output_3_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_3)[i*4+3] = __xlx_real_output_3_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_4
  sc_bv<32>*__xlx_real_output_4_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_4];
  for (int i = 0; i < __xlx_size_param_real_output_4; ++i) {
    __xlx_real_output_4_output_buffer[i] = __xlx_real_output_4__input_buffer[i+__xlx_offset_param_real_output_4];
  }
  for (int i = 0; i < __xlx_size_param_real_output_4; ++i) {
    ((char*)__xlx_apatb_param_real_output_4)[i*4+0] = __xlx_real_output_4_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_4)[i*4+1] = __xlx_real_output_4_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_4)[i*4+2] = __xlx_real_output_4_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_4)[i*4+3] = __xlx_real_output_4_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_5
  sc_bv<32>*__xlx_real_output_5_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_5];
  for (int i = 0; i < __xlx_size_param_real_output_5; ++i) {
    __xlx_real_output_5_output_buffer[i] = __xlx_real_output_5__input_buffer[i+__xlx_offset_param_real_output_5];
  }
  for (int i = 0; i < __xlx_size_param_real_output_5; ++i) {
    ((char*)__xlx_apatb_param_real_output_5)[i*4+0] = __xlx_real_output_5_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_5)[i*4+1] = __xlx_real_output_5_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_5)[i*4+2] = __xlx_real_output_5_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_5)[i*4+3] = __xlx_real_output_5_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_6
  sc_bv<32>*__xlx_real_output_6_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_6];
  for (int i = 0; i < __xlx_size_param_real_output_6; ++i) {
    __xlx_real_output_6_output_buffer[i] = __xlx_real_output_6__input_buffer[i+__xlx_offset_param_real_output_6];
  }
  for (int i = 0; i < __xlx_size_param_real_output_6; ++i) {
    ((char*)__xlx_apatb_param_real_output_6)[i*4+0] = __xlx_real_output_6_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_6)[i*4+1] = __xlx_real_output_6_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_6)[i*4+2] = __xlx_real_output_6_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_6)[i*4+3] = __xlx_real_output_6_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_7
  sc_bv<32>*__xlx_real_output_7_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_7];
  for (int i = 0; i < __xlx_size_param_real_output_7; ++i) {
    __xlx_real_output_7_output_buffer[i] = __xlx_real_output_7__input_buffer[i+__xlx_offset_param_real_output_7];
  }
  for (int i = 0; i < __xlx_size_param_real_output_7; ++i) {
    ((char*)__xlx_apatb_param_real_output_7)[i*4+0] = __xlx_real_output_7_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_7)[i*4+1] = __xlx_real_output_7_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_7)[i*4+2] = __xlx_real_output_7_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_7)[i*4+3] = __xlx_real_output_7_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_8
  sc_bv<32>*__xlx_real_output_8_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_8];
  for (int i = 0; i < __xlx_size_param_real_output_8; ++i) {
    __xlx_real_output_8_output_buffer[i] = __xlx_real_output_8__input_buffer[i+__xlx_offset_param_real_output_8];
  }
  for (int i = 0; i < __xlx_size_param_real_output_8; ++i) {
    ((char*)__xlx_apatb_param_real_output_8)[i*4+0] = __xlx_real_output_8_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_8)[i*4+1] = __xlx_real_output_8_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_8)[i*4+2] = __xlx_real_output_8_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_8)[i*4+3] = __xlx_real_output_8_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_9
  sc_bv<32>*__xlx_real_output_9_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_9];
  for (int i = 0; i < __xlx_size_param_real_output_9; ++i) {
    __xlx_real_output_9_output_buffer[i] = __xlx_real_output_9__input_buffer[i+__xlx_offset_param_real_output_9];
  }
  for (int i = 0; i < __xlx_size_param_real_output_9; ++i) {
    ((char*)__xlx_apatb_param_real_output_9)[i*4+0] = __xlx_real_output_9_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_9)[i*4+1] = __xlx_real_output_9_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_9)[i*4+2] = __xlx_real_output_9_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_9)[i*4+3] = __xlx_real_output_9_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_10
  sc_bv<32>*__xlx_real_output_10_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_10];
  for (int i = 0; i < __xlx_size_param_real_output_10; ++i) {
    __xlx_real_output_10_output_buffer[i] = __xlx_real_output_10__input_buffer[i+__xlx_offset_param_real_output_10];
  }
  for (int i = 0; i < __xlx_size_param_real_output_10; ++i) {
    ((char*)__xlx_apatb_param_real_output_10)[i*4+0] = __xlx_real_output_10_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_10)[i*4+1] = __xlx_real_output_10_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_10)[i*4+2] = __xlx_real_output_10_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_10)[i*4+3] = __xlx_real_output_10_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_11
  sc_bv<32>*__xlx_real_output_11_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_11];
  for (int i = 0; i < __xlx_size_param_real_output_11; ++i) {
    __xlx_real_output_11_output_buffer[i] = __xlx_real_output_11__input_buffer[i+__xlx_offset_param_real_output_11];
  }
  for (int i = 0; i < __xlx_size_param_real_output_11; ++i) {
    ((char*)__xlx_apatb_param_real_output_11)[i*4+0] = __xlx_real_output_11_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_11)[i*4+1] = __xlx_real_output_11_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_11)[i*4+2] = __xlx_real_output_11_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_11)[i*4+3] = __xlx_real_output_11_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_12
  sc_bv<32>*__xlx_real_output_12_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_12];
  for (int i = 0; i < __xlx_size_param_real_output_12; ++i) {
    __xlx_real_output_12_output_buffer[i] = __xlx_real_output_12__input_buffer[i+__xlx_offset_param_real_output_12];
  }
  for (int i = 0; i < __xlx_size_param_real_output_12; ++i) {
    ((char*)__xlx_apatb_param_real_output_12)[i*4+0] = __xlx_real_output_12_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_12)[i*4+1] = __xlx_real_output_12_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_12)[i*4+2] = __xlx_real_output_12_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_12)[i*4+3] = __xlx_real_output_12_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_13
  sc_bv<32>*__xlx_real_output_13_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_13];
  for (int i = 0; i < __xlx_size_param_real_output_13; ++i) {
    __xlx_real_output_13_output_buffer[i] = __xlx_real_output_13__input_buffer[i+__xlx_offset_param_real_output_13];
  }
  for (int i = 0; i < __xlx_size_param_real_output_13; ++i) {
    ((char*)__xlx_apatb_param_real_output_13)[i*4+0] = __xlx_real_output_13_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_13)[i*4+1] = __xlx_real_output_13_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_13)[i*4+2] = __xlx_real_output_13_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_13)[i*4+3] = __xlx_real_output_13_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_14
  sc_bv<32>*__xlx_real_output_14_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_14];
  for (int i = 0; i < __xlx_size_param_real_output_14; ++i) {
    __xlx_real_output_14_output_buffer[i] = __xlx_real_output_14__input_buffer[i+__xlx_offset_param_real_output_14];
  }
  for (int i = 0; i < __xlx_size_param_real_output_14; ++i) {
    ((char*)__xlx_apatb_param_real_output_14)[i*4+0] = __xlx_real_output_14_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_14)[i*4+1] = __xlx_real_output_14_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_14)[i*4+2] = __xlx_real_output_14_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_14)[i*4+3] = __xlx_real_output_14_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_15
  sc_bv<32>*__xlx_real_output_15_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_15];
  for (int i = 0; i < __xlx_size_param_real_output_15; ++i) {
    __xlx_real_output_15_output_buffer[i] = __xlx_real_output_15__input_buffer[i+__xlx_offset_param_real_output_15];
  }
  for (int i = 0; i < __xlx_size_param_real_output_15; ++i) {
    ((char*)__xlx_apatb_param_real_output_15)[i*4+0] = __xlx_real_output_15_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_15)[i*4+1] = __xlx_real_output_15_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_15)[i*4+2] = __xlx_real_output_15_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_15)[i*4+3] = __xlx_real_output_15_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_16
  sc_bv<32>*__xlx_real_output_16_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_16];
  for (int i = 0; i < __xlx_size_param_real_output_16; ++i) {
    __xlx_real_output_16_output_buffer[i] = __xlx_real_output_16__input_buffer[i+__xlx_offset_param_real_output_16];
  }
  for (int i = 0; i < __xlx_size_param_real_output_16; ++i) {
    ((char*)__xlx_apatb_param_real_output_16)[i*4+0] = __xlx_real_output_16_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_16)[i*4+1] = __xlx_real_output_16_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_16)[i*4+2] = __xlx_real_output_16_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_16)[i*4+3] = __xlx_real_output_16_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_17
  sc_bv<32>*__xlx_real_output_17_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_17];
  for (int i = 0; i < __xlx_size_param_real_output_17; ++i) {
    __xlx_real_output_17_output_buffer[i] = __xlx_real_output_17__input_buffer[i+__xlx_offset_param_real_output_17];
  }
  for (int i = 0; i < __xlx_size_param_real_output_17; ++i) {
    ((char*)__xlx_apatb_param_real_output_17)[i*4+0] = __xlx_real_output_17_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_17)[i*4+1] = __xlx_real_output_17_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_17)[i*4+2] = __xlx_real_output_17_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_17)[i*4+3] = __xlx_real_output_17_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_18
  sc_bv<32>*__xlx_real_output_18_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_18];
  for (int i = 0; i < __xlx_size_param_real_output_18; ++i) {
    __xlx_real_output_18_output_buffer[i] = __xlx_real_output_18__input_buffer[i+__xlx_offset_param_real_output_18];
  }
  for (int i = 0; i < __xlx_size_param_real_output_18; ++i) {
    ((char*)__xlx_apatb_param_real_output_18)[i*4+0] = __xlx_real_output_18_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_18)[i*4+1] = __xlx_real_output_18_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_18)[i*4+2] = __xlx_real_output_18_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_18)[i*4+3] = __xlx_real_output_18_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_19
  sc_bv<32>*__xlx_real_output_19_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_19];
  for (int i = 0; i < __xlx_size_param_real_output_19; ++i) {
    __xlx_real_output_19_output_buffer[i] = __xlx_real_output_19__input_buffer[i+__xlx_offset_param_real_output_19];
  }
  for (int i = 0; i < __xlx_size_param_real_output_19; ++i) {
    ((char*)__xlx_apatb_param_real_output_19)[i*4+0] = __xlx_real_output_19_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_19)[i*4+1] = __xlx_real_output_19_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_19)[i*4+2] = __xlx_real_output_19_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_19)[i*4+3] = __xlx_real_output_19_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_20
  sc_bv<32>*__xlx_real_output_20_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_20];
  for (int i = 0; i < __xlx_size_param_real_output_20; ++i) {
    __xlx_real_output_20_output_buffer[i] = __xlx_real_output_20__input_buffer[i+__xlx_offset_param_real_output_20];
  }
  for (int i = 0; i < __xlx_size_param_real_output_20; ++i) {
    ((char*)__xlx_apatb_param_real_output_20)[i*4+0] = __xlx_real_output_20_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_20)[i*4+1] = __xlx_real_output_20_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_20)[i*4+2] = __xlx_real_output_20_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_20)[i*4+3] = __xlx_real_output_20_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_21
  sc_bv<32>*__xlx_real_output_21_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_21];
  for (int i = 0; i < __xlx_size_param_real_output_21; ++i) {
    __xlx_real_output_21_output_buffer[i] = __xlx_real_output_21__input_buffer[i+__xlx_offset_param_real_output_21];
  }
  for (int i = 0; i < __xlx_size_param_real_output_21; ++i) {
    ((char*)__xlx_apatb_param_real_output_21)[i*4+0] = __xlx_real_output_21_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_21)[i*4+1] = __xlx_real_output_21_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_21)[i*4+2] = __xlx_real_output_21_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_21)[i*4+3] = __xlx_real_output_21_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_22
  sc_bv<32>*__xlx_real_output_22_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_22];
  for (int i = 0; i < __xlx_size_param_real_output_22; ++i) {
    __xlx_real_output_22_output_buffer[i] = __xlx_real_output_22__input_buffer[i+__xlx_offset_param_real_output_22];
  }
  for (int i = 0; i < __xlx_size_param_real_output_22; ++i) {
    ((char*)__xlx_apatb_param_real_output_22)[i*4+0] = __xlx_real_output_22_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_22)[i*4+1] = __xlx_real_output_22_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_22)[i*4+2] = __xlx_real_output_22_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_22)[i*4+3] = __xlx_real_output_22_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_23
  sc_bv<32>*__xlx_real_output_23_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_23];
  for (int i = 0; i < __xlx_size_param_real_output_23; ++i) {
    __xlx_real_output_23_output_buffer[i] = __xlx_real_output_23__input_buffer[i+__xlx_offset_param_real_output_23];
  }
  for (int i = 0; i < __xlx_size_param_real_output_23; ++i) {
    ((char*)__xlx_apatb_param_real_output_23)[i*4+0] = __xlx_real_output_23_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_23)[i*4+1] = __xlx_real_output_23_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_23)[i*4+2] = __xlx_real_output_23_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_23)[i*4+3] = __xlx_real_output_23_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_24
  sc_bv<32>*__xlx_real_output_24_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_24];
  for (int i = 0; i < __xlx_size_param_real_output_24; ++i) {
    __xlx_real_output_24_output_buffer[i] = __xlx_real_output_24__input_buffer[i+__xlx_offset_param_real_output_24];
  }
  for (int i = 0; i < __xlx_size_param_real_output_24; ++i) {
    ((char*)__xlx_apatb_param_real_output_24)[i*4+0] = __xlx_real_output_24_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_24)[i*4+1] = __xlx_real_output_24_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_24)[i*4+2] = __xlx_real_output_24_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_24)[i*4+3] = __xlx_real_output_24_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_25
  sc_bv<32>*__xlx_real_output_25_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_25];
  for (int i = 0; i < __xlx_size_param_real_output_25; ++i) {
    __xlx_real_output_25_output_buffer[i] = __xlx_real_output_25__input_buffer[i+__xlx_offset_param_real_output_25];
  }
  for (int i = 0; i < __xlx_size_param_real_output_25; ++i) {
    ((char*)__xlx_apatb_param_real_output_25)[i*4+0] = __xlx_real_output_25_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_25)[i*4+1] = __xlx_real_output_25_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_25)[i*4+2] = __xlx_real_output_25_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_25)[i*4+3] = __xlx_real_output_25_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_26
  sc_bv<32>*__xlx_real_output_26_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_26];
  for (int i = 0; i < __xlx_size_param_real_output_26; ++i) {
    __xlx_real_output_26_output_buffer[i] = __xlx_real_output_26__input_buffer[i+__xlx_offset_param_real_output_26];
  }
  for (int i = 0; i < __xlx_size_param_real_output_26; ++i) {
    ((char*)__xlx_apatb_param_real_output_26)[i*4+0] = __xlx_real_output_26_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_26)[i*4+1] = __xlx_real_output_26_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_26)[i*4+2] = __xlx_real_output_26_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_26)[i*4+3] = __xlx_real_output_26_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_27
  sc_bv<32>*__xlx_real_output_27_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_27];
  for (int i = 0; i < __xlx_size_param_real_output_27; ++i) {
    __xlx_real_output_27_output_buffer[i] = __xlx_real_output_27__input_buffer[i+__xlx_offset_param_real_output_27];
  }
  for (int i = 0; i < __xlx_size_param_real_output_27; ++i) {
    ((char*)__xlx_apatb_param_real_output_27)[i*4+0] = __xlx_real_output_27_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_27)[i*4+1] = __xlx_real_output_27_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_27)[i*4+2] = __xlx_real_output_27_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_27)[i*4+3] = __xlx_real_output_27_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_28
  sc_bv<32>*__xlx_real_output_28_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_28];
  for (int i = 0; i < __xlx_size_param_real_output_28; ++i) {
    __xlx_real_output_28_output_buffer[i] = __xlx_real_output_28__input_buffer[i+__xlx_offset_param_real_output_28];
  }
  for (int i = 0; i < __xlx_size_param_real_output_28; ++i) {
    ((char*)__xlx_apatb_param_real_output_28)[i*4+0] = __xlx_real_output_28_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_28)[i*4+1] = __xlx_real_output_28_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_28)[i*4+2] = __xlx_real_output_28_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_28)[i*4+3] = __xlx_real_output_28_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_29
  sc_bv<32>*__xlx_real_output_29_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_29];
  for (int i = 0; i < __xlx_size_param_real_output_29; ++i) {
    __xlx_real_output_29_output_buffer[i] = __xlx_real_output_29__input_buffer[i+__xlx_offset_param_real_output_29];
  }
  for (int i = 0; i < __xlx_size_param_real_output_29; ++i) {
    ((char*)__xlx_apatb_param_real_output_29)[i*4+0] = __xlx_real_output_29_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_29)[i*4+1] = __xlx_real_output_29_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_29)[i*4+2] = __xlx_real_output_29_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_29)[i*4+3] = __xlx_real_output_29_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_30
  sc_bv<32>*__xlx_real_output_30_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_30];
  for (int i = 0; i < __xlx_size_param_real_output_30; ++i) {
    __xlx_real_output_30_output_buffer[i] = __xlx_real_output_30__input_buffer[i+__xlx_offset_param_real_output_30];
  }
  for (int i = 0; i < __xlx_size_param_real_output_30; ++i) {
    ((char*)__xlx_apatb_param_real_output_30)[i*4+0] = __xlx_real_output_30_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_30)[i*4+1] = __xlx_real_output_30_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_30)[i*4+2] = __xlx_real_output_30_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_30)[i*4+3] = __xlx_real_output_30_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_31
  sc_bv<32>*__xlx_real_output_31_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_31];
  for (int i = 0; i < __xlx_size_param_real_output_31; ++i) {
    __xlx_real_output_31_output_buffer[i] = __xlx_real_output_31__input_buffer[i+__xlx_offset_param_real_output_31];
  }
  for (int i = 0; i < __xlx_size_param_real_output_31; ++i) {
    ((char*)__xlx_apatb_param_real_output_31)[i*4+0] = __xlx_real_output_31_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_31)[i*4+1] = __xlx_real_output_31_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_31)[i*4+2] = __xlx_real_output_31_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_31)[i*4+3] = __xlx_real_output_31_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_32
  sc_bv<32>*__xlx_real_output_32_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_32];
  for (int i = 0; i < __xlx_size_param_real_output_32; ++i) {
    __xlx_real_output_32_output_buffer[i] = __xlx_real_output_32__input_buffer[i+__xlx_offset_param_real_output_32];
  }
  for (int i = 0; i < __xlx_size_param_real_output_32; ++i) {
    ((char*)__xlx_apatb_param_real_output_32)[i*4+0] = __xlx_real_output_32_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_32)[i*4+1] = __xlx_real_output_32_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_32)[i*4+2] = __xlx_real_output_32_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_32)[i*4+3] = __xlx_real_output_32_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_33
  sc_bv<32>*__xlx_real_output_33_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_33];
  for (int i = 0; i < __xlx_size_param_real_output_33; ++i) {
    __xlx_real_output_33_output_buffer[i] = __xlx_real_output_33__input_buffer[i+__xlx_offset_param_real_output_33];
  }
  for (int i = 0; i < __xlx_size_param_real_output_33; ++i) {
    ((char*)__xlx_apatb_param_real_output_33)[i*4+0] = __xlx_real_output_33_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_33)[i*4+1] = __xlx_real_output_33_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_33)[i*4+2] = __xlx_real_output_33_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_33)[i*4+3] = __xlx_real_output_33_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_34
  sc_bv<32>*__xlx_real_output_34_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_34];
  for (int i = 0; i < __xlx_size_param_real_output_34; ++i) {
    __xlx_real_output_34_output_buffer[i] = __xlx_real_output_34__input_buffer[i+__xlx_offset_param_real_output_34];
  }
  for (int i = 0; i < __xlx_size_param_real_output_34; ++i) {
    ((char*)__xlx_apatb_param_real_output_34)[i*4+0] = __xlx_real_output_34_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_34)[i*4+1] = __xlx_real_output_34_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_34)[i*4+2] = __xlx_real_output_34_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_34)[i*4+3] = __xlx_real_output_34_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_35
  sc_bv<32>*__xlx_real_output_35_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_35];
  for (int i = 0; i < __xlx_size_param_real_output_35; ++i) {
    __xlx_real_output_35_output_buffer[i] = __xlx_real_output_35__input_buffer[i+__xlx_offset_param_real_output_35];
  }
  for (int i = 0; i < __xlx_size_param_real_output_35; ++i) {
    ((char*)__xlx_apatb_param_real_output_35)[i*4+0] = __xlx_real_output_35_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_35)[i*4+1] = __xlx_real_output_35_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_35)[i*4+2] = __xlx_real_output_35_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_35)[i*4+3] = __xlx_real_output_35_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_36
  sc_bv<32>*__xlx_real_output_36_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_36];
  for (int i = 0; i < __xlx_size_param_real_output_36; ++i) {
    __xlx_real_output_36_output_buffer[i] = __xlx_real_output_36__input_buffer[i+__xlx_offset_param_real_output_36];
  }
  for (int i = 0; i < __xlx_size_param_real_output_36; ++i) {
    ((char*)__xlx_apatb_param_real_output_36)[i*4+0] = __xlx_real_output_36_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_36)[i*4+1] = __xlx_real_output_36_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_36)[i*4+2] = __xlx_real_output_36_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_36)[i*4+3] = __xlx_real_output_36_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_37
  sc_bv<32>*__xlx_real_output_37_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_37];
  for (int i = 0; i < __xlx_size_param_real_output_37; ++i) {
    __xlx_real_output_37_output_buffer[i] = __xlx_real_output_37__input_buffer[i+__xlx_offset_param_real_output_37];
  }
  for (int i = 0; i < __xlx_size_param_real_output_37; ++i) {
    ((char*)__xlx_apatb_param_real_output_37)[i*4+0] = __xlx_real_output_37_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_37)[i*4+1] = __xlx_real_output_37_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_37)[i*4+2] = __xlx_real_output_37_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_37)[i*4+3] = __xlx_real_output_37_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_38
  sc_bv<32>*__xlx_real_output_38_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_38];
  for (int i = 0; i < __xlx_size_param_real_output_38; ++i) {
    __xlx_real_output_38_output_buffer[i] = __xlx_real_output_38__input_buffer[i+__xlx_offset_param_real_output_38];
  }
  for (int i = 0; i < __xlx_size_param_real_output_38; ++i) {
    ((char*)__xlx_apatb_param_real_output_38)[i*4+0] = __xlx_real_output_38_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_38)[i*4+1] = __xlx_real_output_38_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_38)[i*4+2] = __xlx_real_output_38_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_38)[i*4+3] = __xlx_real_output_38_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_39
  sc_bv<32>*__xlx_real_output_39_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_39];
  for (int i = 0; i < __xlx_size_param_real_output_39; ++i) {
    __xlx_real_output_39_output_buffer[i] = __xlx_real_output_39__input_buffer[i+__xlx_offset_param_real_output_39];
  }
  for (int i = 0; i < __xlx_size_param_real_output_39; ++i) {
    ((char*)__xlx_apatb_param_real_output_39)[i*4+0] = __xlx_real_output_39_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_39)[i*4+1] = __xlx_real_output_39_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_39)[i*4+2] = __xlx_real_output_39_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_39)[i*4+3] = __xlx_real_output_39_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_40
  sc_bv<32>*__xlx_real_output_40_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_40];
  for (int i = 0; i < __xlx_size_param_real_output_40; ++i) {
    __xlx_real_output_40_output_buffer[i] = __xlx_real_output_40__input_buffer[i+__xlx_offset_param_real_output_40];
  }
  for (int i = 0; i < __xlx_size_param_real_output_40; ++i) {
    ((char*)__xlx_apatb_param_real_output_40)[i*4+0] = __xlx_real_output_40_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_40)[i*4+1] = __xlx_real_output_40_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_40)[i*4+2] = __xlx_real_output_40_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_40)[i*4+3] = __xlx_real_output_40_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_41
  sc_bv<32>*__xlx_real_output_41_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_41];
  for (int i = 0; i < __xlx_size_param_real_output_41; ++i) {
    __xlx_real_output_41_output_buffer[i] = __xlx_real_output_41__input_buffer[i+__xlx_offset_param_real_output_41];
  }
  for (int i = 0; i < __xlx_size_param_real_output_41; ++i) {
    ((char*)__xlx_apatb_param_real_output_41)[i*4+0] = __xlx_real_output_41_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_41)[i*4+1] = __xlx_real_output_41_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_41)[i*4+2] = __xlx_real_output_41_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_41)[i*4+3] = __xlx_real_output_41_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_42
  sc_bv<32>*__xlx_real_output_42_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_42];
  for (int i = 0; i < __xlx_size_param_real_output_42; ++i) {
    __xlx_real_output_42_output_buffer[i] = __xlx_real_output_42__input_buffer[i+__xlx_offset_param_real_output_42];
  }
  for (int i = 0; i < __xlx_size_param_real_output_42; ++i) {
    ((char*)__xlx_apatb_param_real_output_42)[i*4+0] = __xlx_real_output_42_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_42)[i*4+1] = __xlx_real_output_42_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_42)[i*4+2] = __xlx_real_output_42_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_42)[i*4+3] = __xlx_real_output_42_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_43
  sc_bv<32>*__xlx_real_output_43_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_43];
  for (int i = 0; i < __xlx_size_param_real_output_43; ++i) {
    __xlx_real_output_43_output_buffer[i] = __xlx_real_output_43__input_buffer[i+__xlx_offset_param_real_output_43];
  }
  for (int i = 0; i < __xlx_size_param_real_output_43; ++i) {
    ((char*)__xlx_apatb_param_real_output_43)[i*4+0] = __xlx_real_output_43_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_43)[i*4+1] = __xlx_real_output_43_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_43)[i*4+2] = __xlx_real_output_43_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_43)[i*4+3] = __xlx_real_output_43_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_44
  sc_bv<32>*__xlx_real_output_44_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_44];
  for (int i = 0; i < __xlx_size_param_real_output_44; ++i) {
    __xlx_real_output_44_output_buffer[i] = __xlx_real_output_44__input_buffer[i+__xlx_offset_param_real_output_44];
  }
  for (int i = 0; i < __xlx_size_param_real_output_44; ++i) {
    ((char*)__xlx_apatb_param_real_output_44)[i*4+0] = __xlx_real_output_44_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_44)[i*4+1] = __xlx_real_output_44_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_44)[i*4+2] = __xlx_real_output_44_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_44)[i*4+3] = __xlx_real_output_44_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_45
  sc_bv<32>*__xlx_real_output_45_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_45];
  for (int i = 0; i < __xlx_size_param_real_output_45; ++i) {
    __xlx_real_output_45_output_buffer[i] = __xlx_real_output_45__input_buffer[i+__xlx_offset_param_real_output_45];
  }
  for (int i = 0; i < __xlx_size_param_real_output_45; ++i) {
    ((char*)__xlx_apatb_param_real_output_45)[i*4+0] = __xlx_real_output_45_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_45)[i*4+1] = __xlx_real_output_45_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_45)[i*4+2] = __xlx_real_output_45_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_45)[i*4+3] = __xlx_real_output_45_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_46
  sc_bv<32>*__xlx_real_output_46_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_46];
  for (int i = 0; i < __xlx_size_param_real_output_46; ++i) {
    __xlx_real_output_46_output_buffer[i] = __xlx_real_output_46__input_buffer[i+__xlx_offset_param_real_output_46];
  }
  for (int i = 0; i < __xlx_size_param_real_output_46; ++i) {
    ((char*)__xlx_apatb_param_real_output_46)[i*4+0] = __xlx_real_output_46_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_46)[i*4+1] = __xlx_real_output_46_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_46)[i*4+2] = __xlx_real_output_46_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_46)[i*4+3] = __xlx_real_output_46_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_47
  sc_bv<32>*__xlx_real_output_47_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_47];
  for (int i = 0; i < __xlx_size_param_real_output_47; ++i) {
    __xlx_real_output_47_output_buffer[i] = __xlx_real_output_47__input_buffer[i+__xlx_offset_param_real_output_47];
  }
  for (int i = 0; i < __xlx_size_param_real_output_47; ++i) {
    ((char*)__xlx_apatb_param_real_output_47)[i*4+0] = __xlx_real_output_47_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_47)[i*4+1] = __xlx_real_output_47_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_47)[i*4+2] = __xlx_real_output_47_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_47)[i*4+3] = __xlx_real_output_47_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_48
  sc_bv<32>*__xlx_real_output_48_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_48];
  for (int i = 0; i < __xlx_size_param_real_output_48; ++i) {
    __xlx_real_output_48_output_buffer[i] = __xlx_real_output_48__input_buffer[i+__xlx_offset_param_real_output_48];
  }
  for (int i = 0; i < __xlx_size_param_real_output_48; ++i) {
    ((char*)__xlx_apatb_param_real_output_48)[i*4+0] = __xlx_real_output_48_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_48)[i*4+1] = __xlx_real_output_48_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_48)[i*4+2] = __xlx_real_output_48_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_48)[i*4+3] = __xlx_real_output_48_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_49
  sc_bv<32>*__xlx_real_output_49_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_49];
  for (int i = 0; i < __xlx_size_param_real_output_49; ++i) {
    __xlx_real_output_49_output_buffer[i] = __xlx_real_output_49__input_buffer[i+__xlx_offset_param_real_output_49];
  }
  for (int i = 0; i < __xlx_size_param_real_output_49; ++i) {
    ((char*)__xlx_apatb_param_real_output_49)[i*4+0] = __xlx_real_output_49_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_49)[i*4+1] = __xlx_real_output_49_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_49)[i*4+2] = __xlx_real_output_49_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_49)[i*4+3] = __xlx_real_output_49_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_50
  sc_bv<32>*__xlx_real_output_50_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_50];
  for (int i = 0; i < __xlx_size_param_real_output_50; ++i) {
    __xlx_real_output_50_output_buffer[i] = __xlx_real_output_50__input_buffer[i+__xlx_offset_param_real_output_50];
  }
  for (int i = 0; i < __xlx_size_param_real_output_50; ++i) {
    ((char*)__xlx_apatb_param_real_output_50)[i*4+0] = __xlx_real_output_50_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_50)[i*4+1] = __xlx_real_output_50_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_50)[i*4+2] = __xlx_real_output_50_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_50)[i*4+3] = __xlx_real_output_50_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_51
  sc_bv<32>*__xlx_real_output_51_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_51];
  for (int i = 0; i < __xlx_size_param_real_output_51; ++i) {
    __xlx_real_output_51_output_buffer[i] = __xlx_real_output_51__input_buffer[i+__xlx_offset_param_real_output_51];
  }
  for (int i = 0; i < __xlx_size_param_real_output_51; ++i) {
    ((char*)__xlx_apatb_param_real_output_51)[i*4+0] = __xlx_real_output_51_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_51)[i*4+1] = __xlx_real_output_51_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_51)[i*4+2] = __xlx_real_output_51_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_51)[i*4+3] = __xlx_real_output_51_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_52
  sc_bv<32>*__xlx_real_output_52_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_52];
  for (int i = 0; i < __xlx_size_param_real_output_52; ++i) {
    __xlx_real_output_52_output_buffer[i] = __xlx_real_output_52__input_buffer[i+__xlx_offset_param_real_output_52];
  }
  for (int i = 0; i < __xlx_size_param_real_output_52; ++i) {
    ((char*)__xlx_apatb_param_real_output_52)[i*4+0] = __xlx_real_output_52_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_52)[i*4+1] = __xlx_real_output_52_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_52)[i*4+2] = __xlx_real_output_52_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_52)[i*4+3] = __xlx_real_output_52_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_53
  sc_bv<32>*__xlx_real_output_53_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_53];
  for (int i = 0; i < __xlx_size_param_real_output_53; ++i) {
    __xlx_real_output_53_output_buffer[i] = __xlx_real_output_53__input_buffer[i+__xlx_offset_param_real_output_53];
  }
  for (int i = 0; i < __xlx_size_param_real_output_53; ++i) {
    ((char*)__xlx_apatb_param_real_output_53)[i*4+0] = __xlx_real_output_53_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_53)[i*4+1] = __xlx_real_output_53_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_53)[i*4+2] = __xlx_real_output_53_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_53)[i*4+3] = __xlx_real_output_53_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_54
  sc_bv<32>*__xlx_real_output_54_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_54];
  for (int i = 0; i < __xlx_size_param_real_output_54; ++i) {
    __xlx_real_output_54_output_buffer[i] = __xlx_real_output_54__input_buffer[i+__xlx_offset_param_real_output_54];
  }
  for (int i = 0; i < __xlx_size_param_real_output_54; ++i) {
    ((char*)__xlx_apatb_param_real_output_54)[i*4+0] = __xlx_real_output_54_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_54)[i*4+1] = __xlx_real_output_54_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_54)[i*4+2] = __xlx_real_output_54_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_54)[i*4+3] = __xlx_real_output_54_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_55
  sc_bv<32>*__xlx_real_output_55_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_55];
  for (int i = 0; i < __xlx_size_param_real_output_55; ++i) {
    __xlx_real_output_55_output_buffer[i] = __xlx_real_output_55__input_buffer[i+__xlx_offset_param_real_output_55];
  }
  for (int i = 0; i < __xlx_size_param_real_output_55; ++i) {
    ((char*)__xlx_apatb_param_real_output_55)[i*4+0] = __xlx_real_output_55_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_55)[i*4+1] = __xlx_real_output_55_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_55)[i*4+2] = __xlx_real_output_55_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_55)[i*4+3] = __xlx_real_output_55_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_56
  sc_bv<32>*__xlx_real_output_56_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_56];
  for (int i = 0; i < __xlx_size_param_real_output_56; ++i) {
    __xlx_real_output_56_output_buffer[i] = __xlx_real_output_56__input_buffer[i+__xlx_offset_param_real_output_56];
  }
  for (int i = 0; i < __xlx_size_param_real_output_56; ++i) {
    ((char*)__xlx_apatb_param_real_output_56)[i*4+0] = __xlx_real_output_56_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_56)[i*4+1] = __xlx_real_output_56_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_56)[i*4+2] = __xlx_real_output_56_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_56)[i*4+3] = __xlx_real_output_56_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_57
  sc_bv<32>*__xlx_real_output_57_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_57];
  for (int i = 0; i < __xlx_size_param_real_output_57; ++i) {
    __xlx_real_output_57_output_buffer[i] = __xlx_real_output_57__input_buffer[i+__xlx_offset_param_real_output_57];
  }
  for (int i = 0; i < __xlx_size_param_real_output_57; ++i) {
    ((char*)__xlx_apatb_param_real_output_57)[i*4+0] = __xlx_real_output_57_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_57)[i*4+1] = __xlx_real_output_57_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_57)[i*4+2] = __xlx_real_output_57_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_57)[i*4+3] = __xlx_real_output_57_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_58
  sc_bv<32>*__xlx_real_output_58_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_58];
  for (int i = 0; i < __xlx_size_param_real_output_58; ++i) {
    __xlx_real_output_58_output_buffer[i] = __xlx_real_output_58__input_buffer[i+__xlx_offset_param_real_output_58];
  }
  for (int i = 0; i < __xlx_size_param_real_output_58; ++i) {
    ((char*)__xlx_apatb_param_real_output_58)[i*4+0] = __xlx_real_output_58_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_58)[i*4+1] = __xlx_real_output_58_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_58)[i*4+2] = __xlx_real_output_58_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_58)[i*4+3] = __xlx_real_output_58_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_59
  sc_bv<32>*__xlx_real_output_59_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_59];
  for (int i = 0; i < __xlx_size_param_real_output_59; ++i) {
    __xlx_real_output_59_output_buffer[i] = __xlx_real_output_59__input_buffer[i+__xlx_offset_param_real_output_59];
  }
  for (int i = 0; i < __xlx_size_param_real_output_59; ++i) {
    ((char*)__xlx_apatb_param_real_output_59)[i*4+0] = __xlx_real_output_59_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_59)[i*4+1] = __xlx_real_output_59_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_59)[i*4+2] = __xlx_real_output_59_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_59)[i*4+3] = __xlx_real_output_59_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_60
  sc_bv<32>*__xlx_real_output_60_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_60];
  for (int i = 0; i < __xlx_size_param_real_output_60; ++i) {
    __xlx_real_output_60_output_buffer[i] = __xlx_real_output_60__input_buffer[i+__xlx_offset_param_real_output_60];
  }
  for (int i = 0; i < __xlx_size_param_real_output_60; ++i) {
    ((char*)__xlx_apatb_param_real_output_60)[i*4+0] = __xlx_real_output_60_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_60)[i*4+1] = __xlx_real_output_60_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_60)[i*4+2] = __xlx_real_output_60_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_60)[i*4+3] = __xlx_real_output_60_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_61
  sc_bv<32>*__xlx_real_output_61_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_61];
  for (int i = 0; i < __xlx_size_param_real_output_61; ++i) {
    __xlx_real_output_61_output_buffer[i] = __xlx_real_output_61__input_buffer[i+__xlx_offset_param_real_output_61];
  }
  for (int i = 0; i < __xlx_size_param_real_output_61; ++i) {
    ((char*)__xlx_apatb_param_real_output_61)[i*4+0] = __xlx_real_output_61_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_61)[i*4+1] = __xlx_real_output_61_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_61)[i*4+2] = __xlx_real_output_61_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_61)[i*4+3] = __xlx_real_output_61_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_62
  sc_bv<32>*__xlx_real_output_62_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_62];
  for (int i = 0; i < __xlx_size_param_real_output_62; ++i) {
    __xlx_real_output_62_output_buffer[i] = __xlx_real_output_62__input_buffer[i+__xlx_offset_param_real_output_62];
  }
  for (int i = 0; i < __xlx_size_param_real_output_62; ++i) {
    ((char*)__xlx_apatb_param_real_output_62)[i*4+0] = __xlx_real_output_62_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_62)[i*4+1] = __xlx_real_output_62_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_62)[i*4+2] = __xlx_real_output_62_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_62)[i*4+3] = __xlx_real_output_62_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_real_output_63
  sc_bv<32>*__xlx_real_output_63_output_buffer = new sc_bv<32>[__xlx_size_param_real_output_63];
  for (int i = 0; i < __xlx_size_param_real_output_63; ++i) {
    __xlx_real_output_63_output_buffer[i] = __xlx_real_output_63__input_buffer[i+__xlx_offset_param_real_output_63];
  }
  for (int i = 0; i < __xlx_size_param_real_output_63; ++i) {
    ((char*)__xlx_apatb_param_real_output_63)[i*4+0] = __xlx_real_output_63_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_real_output_63)[i*4+1] = __xlx_real_output_63_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_real_output_63)[i*4+2] = __xlx_real_output_63_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_real_output_63)[i*4+3] = __xlx_real_output_63_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_0
  sc_bv<32>*__xlx_imag_output_0_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_0];
  for (int i = 0; i < __xlx_size_param_imag_output_0; ++i) {
    __xlx_imag_output_0_output_buffer[i] = __xlx_imag_output_0__input_buffer[i+__xlx_offset_param_imag_output_0];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_0; ++i) {
    ((char*)__xlx_apatb_param_imag_output_0)[i*4+0] = __xlx_imag_output_0_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_0)[i*4+1] = __xlx_imag_output_0_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_0)[i*4+2] = __xlx_imag_output_0_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_0)[i*4+3] = __xlx_imag_output_0_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_1
  sc_bv<32>*__xlx_imag_output_1_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_1];
  for (int i = 0; i < __xlx_size_param_imag_output_1; ++i) {
    __xlx_imag_output_1_output_buffer[i] = __xlx_imag_output_1__input_buffer[i+__xlx_offset_param_imag_output_1];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_1; ++i) {
    ((char*)__xlx_apatb_param_imag_output_1)[i*4+0] = __xlx_imag_output_1_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_1)[i*4+1] = __xlx_imag_output_1_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_1)[i*4+2] = __xlx_imag_output_1_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_1)[i*4+3] = __xlx_imag_output_1_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_2
  sc_bv<32>*__xlx_imag_output_2_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_2];
  for (int i = 0; i < __xlx_size_param_imag_output_2; ++i) {
    __xlx_imag_output_2_output_buffer[i] = __xlx_imag_output_2__input_buffer[i+__xlx_offset_param_imag_output_2];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_2; ++i) {
    ((char*)__xlx_apatb_param_imag_output_2)[i*4+0] = __xlx_imag_output_2_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_2)[i*4+1] = __xlx_imag_output_2_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_2)[i*4+2] = __xlx_imag_output_2_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_2)[i*4+3] = __xlx_imag_output_2_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_3
  sc_bv<32>*__xlx_imag_output_3_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_3];
  for (int i = 0; i < __xlx_size_param_imag_output_3; ++i) {
    __xlx_imag_output_3_output_buffer[i] = __xlx_imag_output_3__input_buffer[i+__xlx_offset_param_imag_output_3];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_3; ++i) {
    ((char*)__xlx_apatb_param_imag_output_3)[i*4+0] = __xlx_imag_output_3_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_3)[i*4+1] = __xlx_imag_output_3_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_3)[i*4+2] = __xlx_imag_output_3_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_3)[i*4+3] = __xlx_imag_output_3_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_4
  sc_bv<32>*__xlx_imag_output_4_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_4];
  for (int i = 0; i < __xlx_size_param_imag_output_4; ++i) {
    __xlx_imag_output_4_output_buffer[i] = __xlx_imag_output_4__input_buffer[i+__xlx_offset_param_imag_output_4];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_4; ++i) {
    ((char*)__xlx_apatb_param_imag_output_4)[i*4+0] = __xlx_imag_output_4_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_4)[i*4+1] = __xlx_imag_output_4_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_4)[i*4+2] = __xlx_imag_output_4_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_4)[i*4+3] = __xlx_imag_output_4_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_5
  sc_bv<32>*__xlx_imag_output_5_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_5];
  for (int i = 0; i < __xlx_size_param_imag_output_5; ++i) {
    __xlx_imag_output_5_output_buffer[i] = __xlx_imag_output_5__input_buffer[i+__xlx_offset_param_imag_output_5];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_5; ++i) {
    ((char*)__xlx_apatb_param_imag_output_5)[i*4+0] = __xlx_imag_output_5_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_5)[i*4+1] = __xlx_imag_output_5_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_5)[i*4+2] = __xlx_imag_output_5_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_5)[i*4+3] = __xlx_imag_output_5_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_6
  sc_bv<32>*__xlx_imag_output_6_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_6];
  for (int i = 0; i < __xlx_size_param_imag_output_6; ++i) {
    __xlx_imag_output_6_output_buffer[i] = __xlx_imag_output_6__input_buffer[i+__xlx_offset_param_imag_output_6];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_6; ++i) {
    ((char*)__xlx_apatb_param_imag_output_6)[i*4+0] = __xlx_imag_output_6_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_6)[i*4+1] = __xlx_imag_output_6_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_6)[i*4+2] = __xlx_imag_output_6_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_6)[i*4+3] = __xlx_imag_output_6_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_7
  sc_bv<32>*__xlx_imag_output_7_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_7];
  for (int i = 0; i < __xlx_size_param_imag_output_7; ++i) {
    __xlx_imag_output_7_output_buffer[i] = __xlx_imag_output_7__input_buffer[i+__xlx_offset_param_imag_output_7];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_7; ++i) {
    ((char*)__xlx_apatb_param_imag_output_7)[i*4+0] = __xlx_imag_output_7_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_7)[i*4+1] = __xlx_imag_output_7_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_7)[i*4+2] = __xlx_imag_output_7_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_7)[i*4+3] = __xlx_imag_output_7_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_8
  sc_bv<32>*__xlx_imag_output_8_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_8];
  for (int i = 0; i < __xlx_size_param_imag_output_8; ++i) {
    __xlx_imag_output_8_output_buffer[i] = __xlx_imag_output_8__input_buffer[i+__xlx_offset_param_imag_output_8];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_8; ++i) {
    ((char*)__xlx_apatb_param_imag_output_8)[i*4+0] = __xlx_imag_output_8_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_8)[i*4+1] = __xlx_imag_output_8_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_8)[i*4+2] = __xlx_imag_output_8_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_8)[i*4+3] = __xlx_imag_output_8_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_9
  sc_bv<32>*__xlx_imag_output_9_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_9];
  for (int i = 0; i < __xlx_size_param_imag_output_9; ++i) {
    __xlx_imag_output_9_output_buffer[i] = __xlx_imag_output_9__input_buffer[i+__xlx_offset_param_imag_output_9];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_9; ++i) {
    ((char*)__xlx_apatb_param_imag_output_9)[i*4+0] = __xlx_imag_output_9_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_9)[i*4+1] = __xlx_imag_output_9_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_9)[i*4+2] = __xlx_imag_output_9_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_9)[i*4+3] = __xlx_imag_output_9_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_10
  sc_bv<32>*__xlx_imag_output_10_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_10];
  for (int i = 0; i < __xlx_size_param_imag_output_10; ++i) {
    __xlx_imag_output_10_output_buffer[i] = __xlx_imag_output_10__input_buffer[i+__xlx_offset_param_imag_output_10];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_10; ++i) {
    ((char*)__xlx_apatb_param_imag_output_10)[i*4+0] = __xlx_imag_output_10_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_10)[i*4+1] = __xlx_imag_output_10_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_10)[i*4+2] = __xlx_imag_output_10_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_10)[i*4+3] = __xlx_imag_output_10_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_11
  sc_bv<32>*__xlx_imag_output_11_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_11];
  for (int i = 0; i < __xlx_size_param_imag_output_11; ++i) {
    __xlx_imag_output_11_output_buffer[i] = __xlx_imag_output_11__input_buffer[i+__xlx_offset_param_imag_output_11];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_11; ++i) {
    ((char*)__xlx_apatb_param_imag_output_11)[i*4+0] = __xlx_imag_output_11_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_11)[i*4+1] = __xlx_imag_output_11_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_11)[i*4+2] = __xlx_imag_output_11_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_11)[i*4+3] = __xlx_imag_output_11_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_12
  sc_bv<32>*__xlx_imag_output_12_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_12];
  for (int i = 0; i < __xlx_size_param_imag_output_12; ++i) {
    __xlx_imag_output_12_output_buffer[i] = __xlx_imag_output_12__input_buffer[i+__xlx_offset_param_imag_output_12];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_12; ++i) {
    ((char*)__xlx_apatb_param_imag_output_12)[i*4+0] = __xlx_imag_output_12_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_12)[i*4+1] = __xlx_imag_output_12_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_12)[i*4+2] = __xlx_imag_output_12_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_12)[i*4+3] = __xlx_imag_output_12_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_13
  sc_bv<32>*__xlx_imag_output_13_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_13];
  for (int i = 0; i < __xlx_size_param_imag_output_13; ++i) {
    __xlx_imag_output_13_output_buffer[i] = __xlx_imag_output_13__input_buffer[i+__xlx_offset_param_imag_output_13];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_13; ++i) {
    ((char*)__xlx_apatb_param_imag_output_13)[i*4+0] = __xlx_imag_output_13_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_13)[i*4+1] = __xlx_imag_output_13_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_13)[i*4+2] = __xlx_imag_output_13_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_13)[i*4+3] = __xlx_imag_output_13_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_14
  sc_bv<32>*__xlx_imag_output_14_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_14];
  for (int i = 0; i < __xlx_size_param_imag_output_14; ++i) {
    __xlx_imag_output_14_output_buffer[i] = __xlx_imag_output_14__input_buffer[i+__xlx_offset_param_imag_output_14];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_14; ++i) {
    ((char*)__xlx_apatb_param_imag_output_14)[i*4+0] = __xlx_imag_output_14_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_14)[i*4+1] = __xlx_imag_output_14_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_14)[i*4+2] = __xlx_imag_output_14_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_14)[i*4+3] = __xlx_imag_output_14_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_15
  sc_bv<32>*__xlx_imag_output_15_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_15];
  for (int i = 0; i < __xlx_size_param_imag_output_15; ++i) {
    __xlx_imag_output_15_output_buffer[i] = __xlx_imag_output_15__input_buffer[i+__xlx_offset_param_imag_output_15];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_15; ++i) {
    ((char*)__xlx_apatb_param_imag_output_15)[i*4+0] = __xlx_imag_output_15_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_15)[i*4+1] = __xlx_imag_output_15_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_15)[i*4+2] = __xlx_imag_output_15_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_15)[i*4+3] = __xlx_imag_output_15_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_16
  sc_bv<32>*__xlx_imag_output_16_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_16];
  for (int i = 0; i < __xlx_size_param_imag_output_16; ++i) {
    __xlx_imag_output_16_output_buffer[i] = __xlx_imag_output_16__input_buffer[i+__xlx_offset_param_imag_output_16];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_16; ++i) {
    ((char*)__xlx_apatb_param_imag_output_16)[i*4+0] = __xlx_imag_output_16_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_16)[i*4+1] = __xlx_imag_output_16_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_16)[i*4+2] = __xlx_imag_output_16_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_16)[i*4+3] = __xlx_imag_output_16_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_17
  sc_bv<32>*__xlx_imag_output_17_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_17];
  for (int i = 0; i < __xlx_size_param_imag_output_17; ++i) {
    __xlx_imag_output_17_output_buffer[i] = __xlx_imag_output_17__input_buffer[i+__xlx_offset_param_imag_output_17];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_17; ++i) {
    ((char*)__xlx_apatb_param_imag_output_17)[i*4+0] = __xlx_imag_output_17_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_17)[i*4+1] = __xlx_imag_output_17_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_17)[i*4+2] = __xlx_imag_output_17_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_17)[i*4+3] = __xlx_imag_output_17_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_18
  sc_bv<32>*__xlx_imag_output_18_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_18];
  for (int i = 0; i < __xlx_size_param_imag_output_18; ++i) {
    __xlx_imag_output_18_output_buffer[i] = __xlx_imag_output_18__input_buffer[i+__xlx_offset_param_imag_output_18];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_18; ++i) {
    ((char*)__xlx_apatb_param_imag_output_18)[i*4+0] = __xlx_imag_output_18_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_18)[i*4+1] = __xlx_imag_output_18_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_18)[i*4+2] = __xlx_imag_output_18_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_18)[i*4+3] = __xlx_imag_output_18_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_19
  sc_bv<32>*__xlx_imag_output_19_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_19];
  for (int i = 0; i < __xlx_size_param_imag_output_19; ++i) {
    __xlx_imag_output_19_output_buffer[i] = __xlx_imag_output_19__input_buffer[i+__xlx_offset_param_imag_output_19];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_19; ++i) {
    ((char*)__xlx_apatb_param_imag_output_19)[i*4+0] = __xlx_imag_output_19_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_19)[i*4+1] = __xlx_imag_output_19_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_19)[i*4+2] = __xlx_imag_output_19_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_19)[i*4+3] = __xlx_imag_output_19_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_20
  sc_bv<32>*__xlx_imag_output_20_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_20];
  for (int i = 0; i < __xlx_size_param_imag_output_20; ++i) {
    __xlx_imag_output_20_output_buffer[i] = __xlx_imag_output_20__input_buffer[i+__xlx_offset_param_imag_output_20];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_20; ++i) {
    ((char*)__xlx_apatb_param_imag_output_20)[i*4+0] = __xlx_imag_output_20_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_20)[i*4+1] = __xlx_imag_output_20_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_20)[i*4+2] = __xlx_imag_output_20_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_20)[i*4+3] = __xlx_imag_output_20_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_21
  sc_bv<32>*__xlx_imag_output_21_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_21];
  for (int i = 0; i < __xlx_size_param_imag_output_21; ++i) {
    __xlx_imag_output_21_output_buffer[i] = __xlx_imag_output_21__input_buffer[i+__xlx_offset_param_imag_output_21];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_21; ++i) {
    ((char*)__xlx_apatb_param_imag_output_21)[i*4+0] = __xlx_imag_output_21_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_21)[i*4+1] = __xlx_imag_output_21_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_21)[i*4+2] = __xlx_imag_output_21_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_21)[i*4+3] = __xlx_imag_output_21_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_22
  sc_bv<32>*__xlx_imag_output_22_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_22];
  for (int i = 0; i < __xlx_size_param_imag_output_22; ++i) {
    __xlx_imag_output_22_output_buffer[i] = __xlx_imag_output_22__input_buffer[i+__xlx_offset_param_imag_output_22];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_22; ++i) {
    ((char*)__xlx_apatb_param_imag_output_22)[i*4+0] = __xlx_imag_output_22_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_22)[i*4+1] = __xlx_imag_output_22_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_22)[i*4+2] = __xlx_imag_output_22_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_22)[i*4+3] = __xlx_imag_output_22_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_23
  sc_bv<32>*__xlx_imag_output_23_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_23];
  for (int i = 0; i < __xlx_size_param_imag_output_23; ++i) {
    __xlx_imag_output_23_output_buffer[i] = __xlx_imag_output_23__input_buffer[i+__xlx_offset_param_imag_output_23];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_23; ++i) {
    ((char*)__xlx_apatb_param_imag_output_23)[i*4+0] = __xlx_imag_output_23_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_23)[i*4+1] = __xlx_imag_output_23_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_23)[i*4+2] = __xlx_imag_output_23_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_23)[i*4+3] = __xlx_imag_output_23_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_24
  sc_bv<32>*__xlx_imag_output_24_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_24];
  for (int i = 0; i < __xlx_size_param_imag_output_24; ++i) {
    __xlx_imag_output_24_output_buffer[i] = __xlx_imag_output_24__input_buffer[i+__xlx_offset_param_imag_output_24];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_24; ++i) {
    ((char*)__xlx_apatb_param_imag_output_24)[i*4+0] = __xlx_imag_output_24_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_24)[i*4+1] = __xlx_imag_output_24_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_24)[i*4+2] = __xlx_imag_output_24_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_24)[i*4+3] = __xlx_imag_output_24_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_25
  sc_bv<32>*__xlx_imag_output_25_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_25];
  for (int i = 0; i < __xlx_size_param_imag_output_25; ++i) {
    __xlx_imag_output_25_output_buffer[i] = __xlx_imag_output_25__input_buffer[i+__xlx_offset_param_imag_output_25];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_25; ++i) {
    ((char*)__xlx_apatb_param_imag_output_25)[i*4+0] = __xlx_imag_output_25_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_25)[i*4+1] = __xlx_imag_output_25_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_25)[i*4+2] = __xlx_imag_output_25_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_25)[i*4+3] = __xlx_imag_output_25_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_26
  sc_bv<32>*__xlx_imag_output_26_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_26];
  for (int i = 0; i < __xlx_size_param_imag_output_26; ++i) {
    __xlx_imag_output_26_output_buffer[i] = __xlx_imag_output_26__input_buffer[i+__xlx_offset_param_imag_output_26];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_26; ++i) {
    ((char*)__xlx_apatb_param_imag_output_26)[i*4+0] = __xlx_imag_output_26_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_26)[i*4+1] = __xlx_imag_output_26_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_26)[i*4+2] = __xlx_imag_output_26_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_26)[i*4+3] = __xlx_imag_output_26_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_27
  sc_bv<32>*__xlx_imag_output_27_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_27];
  for (int i = 0; i < __xlx_size_param_imag_output_27; ++i) {
    __xlx_imag_output_27_output_buffer[i] = __xlx_imag_output_27__input_buffer[i+__xlx_offset_param_imag_output_27];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_27; ++i) {
    ((char*)__xlx_apatb_param_imag_output_27)[i*4+0] = __xlx_imag_output_27_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_27)[i*4+1] = __xlx_imag_output_27_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_27)[i*4+2] = __xlx_imag_output_27_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_27)[i*4+3] = __xlx_imag_output_27_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_28
  sc_bv<32>*__xlx_imag_output_28_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_28];
  for (int i = 0; i < __xlx_size_param_imag_output_28; ++i) {
    __xlx_imag_output_28_output_buffer[i] = __xlx_imag_output_28__input_buffer[i+__xlx_offset_param_imag_output_28];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_28; ++i) {
    ((char*)__xlx_apatb_param_imag_output_28)[i*4+0] = __xlx_imag_output_28_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_28)[i*4+1] = __xlx_imag_output_28_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_28)[i*4+2] = __xlx_imag_output_28_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_28)[i*4+3] = __xlx_imag_output_28_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_29
  sc_bv<32>*__xlx_imag_output_29_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_29];
  for (int i = 0; i < __xlx_size_param_imag_output_29; ++i) {
    __xlx_imag_output_29_output_buffer[i] = __xlx_imag_output_29__input_buffer[i+__xlx_offset_param_imag_output_29];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_29; ++i) {
    ((char*)__xlx_apatb_param_imag_output_29)[i*4+0] = __xlx_imag_output_29_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_29)[i*4+1] = __xlx_imag_output_29_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_29)[i*4+2] = __xlx_imag_output_29_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_29)[i*4+3] = __xlx_imag_output_29_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_30
  sc_bv<32>*__xlx_imag_output_30_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_30];
  for (int i = 0; i < __xlx_size_param_imag_output_30; ++i) {
    __xlx_imag_output_30_output_buffer[i] = __xlx_imag_output_30__input_buffer[i+__xlx_offset_param_imag_output_30];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_30; ++i) {
    ((char*)__xlx_apatb_param_imag_output_30)[i*4+0] = __xlx_imag_output_30_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_30)[i*4+1] = __xlx_imag_output_30_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_30)[i*4+2] = __xlx_imag_output_30_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_30)[i*4+3] = __xlx_imag_output_30_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_31
  sc_bv<32>*__xlx_imag_output_31_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_31];
  for (int i = 0; i < __xlx_size_param_imag_output_31; ++i) {
    __xlx_imag_output_31_output_buffer[i] = __xlx_imag_output_31__input_buffer[i+__xlx_offset_param_imag_output_31];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_31; ++i) {
    ((char*)__xlx_apatb_param_imag_output_31)[i*4+0] = __xlx_imag_output_31_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_31)[i*4+1] = __xlx_imag_output_31_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_31)[i*4+2] = __xlx_imag_output_31_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_31)[i*4+3] = __xlx_imag_output_31_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_32
  sc_bv<32>*__xlx_imag_output_32_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_32];
  for (int i = 0; i < __xlx_size_param_imag_output_32; ++i) {
    __xlx_imag_output_32_output_buffer[i] = __xlx_imag_output_32__input_buffer[i+__xlx_offset_param_imag_output_32];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_32; ++i) {
    ((char*)__xlx_apatb_param_imag_output_32)[i*4+0] = __xlx_imag_output_32_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_32)[i*4+1] = __xlx_imag_output_32_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_32)[i*4+2] = __xlx_imag_output_32_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_32)[i*4+3] = __xlx_imag_output_32_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_33
  sc_bv<32>*__xlx_imag_output_33_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_33];
  for (int i = 0; i < __xlx_size_param_imag_output_33; ++i) {
    __xlx_imag_output_33_output_buffer[i] = __xlx_imag_output_33__input_buffer[i+__xlx_offset_param_imag_output_33];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_33; ++i) {
    ((char*)__xlx_apatb_param_imag_output_33)[i*4+0] = __xlx_imag_output_33_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_33)[i*4+1] = __xlx_imag_output_33_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_33)[i*4+2] = __xlx_imag_output_33_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_33)[i*4+3] = __xlx_imag_output_33_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_34
  sc_bv<32>*__xlx_imag_output_34_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_34];
  for (int i = 0; i < __xlx_size_param_imag_output_34; ++i) {
    __xlx_imag_output_34_output_buffer[i] = __xlx_imag_output_34__input_buffer[i+__xlx_offset_param_imag_output_34];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_34; ++i) {
    ((char*)__xlx_apatb_param_imag_output_34)[i*4+0] = __xlx_imag_output_34_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_34)[i*4+1] = __xlx_imag_output_34_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_34)[i*4+2] = __xlx_imag_output_34_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_34)[i*4+3] = __xlx_imag_output_34_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_35
  sc_bv<32>*__xlx_imag_output_35_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_35];
  for (int i = 0; i < __xlx_size_param_imag_output_35; ++i) {
    __xlx_imag_output_35_output_buffer[i] = __xlx_imag_output_35__input_buffer[i+__xlx_offset_param_imag_output_35];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_35; ++i) {
    ((char*)__xlx_apatb_param_imag_output_35)[i*4+0] = __xlx_imag_output_35_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_35)[i*4+1] = __xlx_imag_output_35_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_35)[i*4+2] = __xlx_imag_output_35_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_35)[i*4+3] = __xlx_imag_output_35_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_36
  sc_bv<32>*__xlx_imag_output_36_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_36];
  for (int i = 0; i < __xlx_size_param_imag_output_36; ++i) {
    __xlx_imag_output_36_output_buffer[i] = __xlx_imag_output_36__input_buffer[i+__xlx_offset_param_imag_output_36];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_36; ++i) {
    ((char*)__xlx_apatb_param_imag_output_36)[i*4+0] = __xlx_imag_output_36_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_36)[i*4+1] = __xlx_imag_output_36_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_36)[i*4+2] = __xlx_imag_output_36_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_36)[i*4+3] = __xlx_imag_output_36_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_37
  sc_bv<32>*__xlx_imag_output_37_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_37];
  for (int i = 0; i < __xlx_size_param_imag_output_37; ++i) {
    __xlx_imag_output_37_output_buffer[i] = __xlx_imag_output_37__input_buffer[i+__xlx_offset_param_imag_output_37];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_37; ++i) {
    ((char*)__xlx_apatb_param_imag_output_37)[i*4+0] = __xlx_imag_output_37_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_37)[i*4+1] = __xlx_imag_output_37_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_37)[i*4+2] = __xlx_imag_output_37_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_37)[i*4+3] = __xlx_imag_output_37_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_38
  sc_bv<32>*__xlx_imag_output_38_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_38];
  for (int i = 0; i < __xlx_size_param_imag_output_38; ++i) {
    __xlx_imag_output_38_output_buffer[i] = __xlx_imag_output_38__input_buffer[i+__xlx_offset_param_imag_output_38];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_38; ++i) {
    ((char*)__xlx_apatb_param_imag_output_38)[i*4+0] = __xlx_imag_output_38_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_38)[i*4+1] = __xlx_imag_output_38_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_38)[i*4+2] = __xlx_imag_output_38_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_38)[i*4+3] = __xlx_imag_output_38_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_39
  sc_bv<32>*__xlx_imag_output_39_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_39];
  for (int i = 0; i < __xlx_size_param_imag_output_39; ++i) {
    __xlx_imag_output_39_output_buffer[i] = __xlx_imag_output_39__input_buffer[i+__xlx_offset_param_imag_output_39];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_39; ++i) {
    ((char*)__xlx_apatb_param_imag_output_39)[i*4+0] = __xlx_imag_output_39_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_39)[i*4+1] = __xlx_imag_output_39_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_39)[i*4+2] = __xlx_imag_output_39_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_39)[i*4+3] = __xlx_imag_output_39_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_40
  sc_bv<32>*__xlx_imag_output_40_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_40];
  for (int i = 0; i < __xlx_size_param_imag_output_40; ++i) {
    __xlx_imag_output_40_output_buffer[i] = __xlx_imag_output_40__input_buffer[i+__xlx_offset_param_imag_output_40];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_40; ++i) {
    ((char*)__xlx_apatb_param_imag_output_40)[i*4+0] = __xlx_imag_output_40_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_40)[i*4+1] = __xlx_imag_output_40_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_40)[i*4+2] = __xlx_imag_output_40_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_40)[i*4+3] = __xlx_imag_output_40_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_41
  sc_bv<32>*__xlx_imag_output_41_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_41];
  for (int i = 0; i < __xlx_size_param_imag_output_41; ++i) {
    __xlx_imag_output_41_output_buffer[i] = __xlx_imag_output_41__input_buffer[i+__xlx_offset_param_imag_output_41];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_41; ++i) {
    ((char*)__xlx_apatb_param_imag_output_41)[i*4+0] = __xlx_imag_output_41_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_41)[i*4+1] = __xlx_imag_output_41_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_41)[i*4+2] = __xlx_imag_output_41_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_41)[i*4+3] = __xlx_imag_output_41_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_42
  sc_bv<32>*__xlx_imag_output_42_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_42];
  for (int i = 0; i < __xlx_size_param_imag_output_42; ++i) {
    __xlx_imag_output_42_output_buffer[i] = __xlx_imag_output_42__input_buffer[i+__xlx_offset_param_imag_output_42];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_42; ++i) {
    ((char*)__xlx_apatb_param_imag_output_42)[i*4+0] = __xlx_imag_output_42_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_42)[i*4+1] = __xlx_imag_output_42_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_42)[i*4+2] = __xlx_imag_output_42_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_42)[i*4+3] = __xlx_imag_output_42_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_43
  sc_bv<32>*__xlx_imag_output_43_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_43];
  for (int i = 0; i < __xlx_size_param_imag_output_43; ++i) {
    __xlx_imag_output_43_output_buffer[i] = __xlx_imag_output_43__input_buffer[i+__xlx_offset_param_imag_output_43];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_43; ++i) {
    ((char*)__xlx_apatb_param_imag_output_43)[i*4+0] = __xlx_imag_output_43_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_43)[i*4+1] = __xlx_imag_output_43_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_43)[i*4+2] = __xlx_imag_output_43_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_43)[i*4+3] = __xlx_imag_output_43_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_44
  sc_bv<32>*__xlx_imag_output_44_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_44];
  for (int i = 0; i < __xlx_size_param_imag_output_44; ++i) {
    __xlx_imag_output_44_output_buffer[i] = __xlx_imag_output_44__input_buffer[i+__xlx_offset_param_imag_output_44];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_44; ++i) {
    ((char*)__xlx_apatb_param_imag_output_44)[i*4+0] = __xlx_imag_output_44_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_44)[i*4+1] = __xlx_imag_output_44_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_44)[i*4+2] = __xlx_imag_output_44_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_44)[i*4+3] = __xlx_imag_output_44_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_45
  sc_bv<32>*__xlx_imag_output_45_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_45];
  for (int i = 0; i < __xlx_size_param_imag_output_45; ++i) {
    __xlx_imag_output_45_output_buffer[i] = __xlx_imag_output_45__input_buffer[i+__xlx_offset_param_imag_output_45];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_45; ++i) {
    ((char*)__xlx_apatb_param_imag_output_45)[i*4+0] = __xlx_imag_output_45_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_45)[i*4+1] = __xlx_imag_output_45_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_45)[i*4+2] = __xlx_imag_output_45_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_45)[i*4+3] = __xlx_imag_output_45_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_46
  sc_bv<32>*__xlx_imag_output_46_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_46];
  for (int i = 0; i < __xlx_size_param_imag_output_46; ++i) {
    __xlx_imag_output_46_output_buffer[i] = __xlx_imag_output_46__input_buffer[i+__xlx_offset_param_imag_output_46];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_46; ++i) {
    ((char*)__xlx_apatb_param_imag_output_46)[i*4+0] = __xlx_imag_output_46_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_46)[i*4+1] = __xlx_imag_output_46_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_46)[i*4+2] = __xlx_imag_output_46_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_46)[i*4+3] = __xlx_imag_output_46_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_47
  sc_bv<32>*__xlx_imag_output_47_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_47];
  for (int i = 0; i < __xlx_size_param_imag_output_47; ++i) {
    __xlx_imag_output_47_output_buffer[i] = __xlx_imag_output_47__input_buffer[i+__xlx_offset_param_imag_output_47];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_47; ++i) {
    ((char*)__xlx_apatb_param_imag_output_47)[i*4+0] = __xlx_imag_output_47_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_47)[i*4+1] = __xlx_imag_output_47_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_47)[i*4+2] = __xlx_imag_output_47_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_47)[i*4+3] = __xlx_imag_output_47_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_48
  sc_bv<32>*__xlx_imag_output_48_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_48];
  for (int i = 0; i < __xlx_size_param_imag_output_48; ++i) {
    __xlx_imag_output_48_output_buffer[i] = __xlx_imag_output_48__input_buffer[i+__xlx_offset_param_imag_output_48];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_48; ++i) {
    ((char*)__xlx_apatb_param_imag_output_48)[i*4+0] = __xlx_imag_output_48_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_48)[i*4+1] = __xlx_imag_output_48_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_48)[i*4+2] = __xlx_imag_output_48_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_48)[i*4+3] = __xlx_imag_output_48_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_49
  sc_bv<32>*__xlx_imag_output_49_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_49];
  for (int i = 0; i < __xlx_size_param_imag_output_49; ++i) {
    __xlx_imag_output_49_output_buffer[i] = __xlx_imag_output_49__input_buffer[i+__xlx_offset_param_imag_output_49];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_49; ++i) {
    ((char*)__xlx_apatb_param_imag_output_49)[i*4+0] = __xlx_imag_output_49_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_49)[i*4+1] = __xlx_imag_output_49_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_49)[i*4+2] = __xlx_imag_output_49_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_49)[i*4+3] = __xlx_imag_output_49_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_50
  sc_bv<32>*__xlx_imag_output_50_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_50];
  for (int i = 0; i < __xlx_size_param_imag_output_50; ++i) {
    __xlx_imag_output_50_output_buffer[i] = __xlx_imag_output_50__input_buffer[i+__xlx_offset_param_imag_output_50];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_50; ++i) {
    ((char*)__xlx_apatb_param_imag_output_50)[i*4+0] = __xlx_imag_output_50_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_50)[i*4+1] = __xlx_imag_output_50_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_50)[i*4+2] = __xlx_imag_output_50_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_50)[i*4+3] = __xlx_imag_output_50_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_51
  sc_bv<32>*__xlx_imag_output_51_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_51];
  for (int i = 0; i < __xlx_size_param_imag_output_51; ++i) {
    __xlx_imag_output_51_output_buffer[i] = __xlx_imag_output_51__input_buffer[i+__xlx_offset_param_imag_output_51];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_51; ++i) {
    ((char*)__xlx_apatb_param_imag_output_51)[i*4+0] = __xlx_imag_output_51_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_51)[i*4+1] = __xlx_imag_output_51_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_51)[i*4+2] = __xlx_imag_output_51_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_51)[i*4+3] = __xlx_imag_output_51_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_52
  sc_bv<32>*__xlx_imag_output_52_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_52];
  for (int i = 0; i < __xlx_size_param_imag_output_52; ++i) {
    __xlx_imag_output_52_output_buffer[i] = __xlx_imag_output_52__input_buffer[i+__xlx_offset_param_imag_output_52];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_52; ++i) {
    ((char*)__xlx_apatb_param_imag_output_52)[i*4+0] = __xlx_imag_output_52_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_52)[i*4+1] = __xlx_imag_output_52_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_52)[i*4+2] = __xlx_imag_output_52_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_52)[i*4+3] = __xlx_imag_output_52_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_53
  sc_bv<32>*__xlx_imag_output_53_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_53];
  for (int i = 0; i < __xlx_size_param_imag_output_53; ++i) {
    __xlx_imag_output_53_output_buffer[i] = __xlx_imag_output_53__input_buffer[i+__xlx_offset_param_imag_output_53];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_53; ++i) {
    ((char*)__xlx_apatb_param_imag_output_53)[i*4+0] = __xlx_imag_output_53_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_53)[i*4+1] = __xlx_imag_output_53_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_53)[i*4+2] = __xlx_imag_output_53_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_53)[i*4+3] = __xlx_imag_output_53_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_54
  sc_bv<32>*__xlx_imag_output_54_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_54];
  for (int i = 0; i < __xlx_size_param_imag_output_54; ++i) {
    __xlx_imag_output_54_output_buffer[i] = __xlx_imag_output_54__input_buffer[i+__xlx_offset_param_imag_output_54];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_54; ++i) {
    ((char*)__xlx_apatb_param_imag_output_54)[i*4+0] = __xlx_imag_output_54_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_54)[i*4+1] = __xlx_imag_output_54_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_54)[i*4+2] = __xlx_imag_output_54_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_54)[i*4+3] = __xlx_imag_output_54_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_55
  sc_bv<32>*__xlx_imag_output_55_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_55];
  for (int i = 0; i < __xlx_size_param_imag_output_55; ++i) {
    __xlx_imag_output_55_output_buffer[i] = __xlx_imag_output_55__input_buffer[i+__xlx_offset_param_imag_output_55];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_55; ++i) {
    ((char*)__xlx_apatb_param_imag_output_55)[i*4+0] = __xlx_imag_output_55_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_55)[i*4+1] = __xlx_imag_output_55_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_55)[i*4+2] = __xlx_imag_output_55_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_55)[i*4+3] = __xlx_imag_output_55_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_56
  sc_bv<32>*__xlx_imag_output_56_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_56];
  for (int i = 0; i < __xlx_size_param_imag_output_56; ++i) {
    __xlx_imag_output_56_output_buffer[i] = __xlx_imag_output_56__input_buffer[i+__xlx_offset_param_imag_output_56];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_56; ++i) {
    ((char*)__xlx_apatb_param_imag_output_56)[i*4+0] = __xlx_imag_output_56_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_56)[i*4+1] = __xlx_imag_output_56_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_56)[i*4+2] = __xlx_imag_output_56_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_56)[i*4+3] = __xlx_imag_output_56_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_57
  sc_bv<32>*__xlx_imag_output_57_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_57];
  for (int i = 0; i < __xlx_size_param_imag_output_57; ++i) {
    __xlx_imag_output_57_output_buffer[i] = __xlx_imag_output_57__input_buffer[i+__xlx_offset_param_imag_output_57];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_57; ++i) {
    ((char*)__xlx_apatb_param_imag_output_57)[i*4+0] = __xlx_imag_output_57_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_57)[i*4+1] = __xlx_imag_output_57_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_57)[i*4+2] = __xlx_imag_output_57_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_57)[i*4+3] = __xlx_imag_output_57_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_58
  sc_bv<32>*__xlx_imag_output_58_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_58];
  for (int i = 0; i < __xlx_size_param_imag_output_58; ++i) {
    __xlx_imag_output_58_output_buffer[i] = __xlx_imag_output_58__input_buffer[i+__xlx_offset_param_imag_output_58];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_58; ++i) {
    ((char*)__xlx_apatb_param_imag_output_58)[i*4+0] = __xlx_imag_output_58_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_58)[i*4+1] = __xlx_imag_output_58_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_58)[i*4+2] = __xlx_imag_output_58_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_58)[i*4+3] = __xlx_imag_output_58_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_59
  sc_bv<32>*__xlx_imag_output_59_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_59];
  for (int i = 0; i < __xlx_size_param_imag_output_59; ++i) {
    __xlx_imag_output_59_output_buffer[i] = __xlx_imag_output_59__input_buffer[i+__xlx_offset_param_imag_output_59];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_59; ++i) {
    ((char*)__xlx_apatb_param_imag_output_59)[i*4+0] = __xlx_imag_output_59_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_59)[i*4+1] = __xlx_imag_output_59_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_59)[i*4+2] = __xlx_imag_output_59_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_59)[i*4+3] = __xlx_imag_output_59_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_60
  sc_bv<32>*__xlx_imag_output_60_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_60];
  for (int i = 0; i < __xlx_size_param_imag_output_60; ++i) {
    __xlx_imag_output_60_output_buffer[i] = __xlx_imag_output_60__input_buffer[i+__xlx_offset_param_imag_output_60];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_60; ++i) {
    ((char*)__xlx_apatb_param_imag_output_60)[i*4+0] = __xlx_imag_output_60_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_60)[i*4+1] = __xlx_imag_output_60_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_60)[i*4+2] = __xlx_imag_output_60_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_60)[i*4+3] = __xlx_imag_output_60_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_61
  sc_bv<32>*__xlx_imag_output_61_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_61];
  for (int i = 0; i < __xlx_size_param_imag_output_61; ++i) {
    __xlx_imag_output_61_output_buffer[i] = __xlx_imag_output_61__input_buffer[i+__xlx_offset_param_imag_output_61];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_61; ++i) {
    ((char*)__xlx_apatb_param_imag_output_61)[i*4+0] = __xlx_imag_output_61_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_61)[i*4+1] = __xlx_imag_output_61_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_61)[i*4+2] = __xlx_imag_output_61_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_61)[i*4+3] = __xlx_imag_output_61_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_62
  sc_bv<32>*__xlx_imag_output_62_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_62];
  for (int i = 0; i < __xlx_size_param_imag_output_62; ++i) {
    __xlx_imag_output_62_output_buffer[i] = __xlx_imag_output_62__input_buffer[i+__xlx_offset_param_imag_output_62];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_62; ++i) {
    ((char*)__xlx_apatb_param_imag_output_62)[i*4+0] = __xlx_imag_output_62_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_62)[i*4+1] = __xlx_imag_output_62_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_62)[i*4+2] = __xlx_imag_output_62_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_62)[i*4+3] = __xlx_imag_output_62_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_imag_output_63
  sc_bv<32>*__xlx_imag_output_63_output_buffer = new sc_bv<32>[__xlx_size_param_imag_output_63];
  for (int i = 0; i < __xlx_size_param_imag_output_63; ++i) {
    __xlx_imag_output_63_output_buffer[i] = __xlx_imag_output_63__input_buffer[i+__xlx_offset_param_imag_output_63];
  }
  for (int i = 0; i < __xlx_size_param_imag_output_63; ++i) {
    ((char*)__xlx_apatb_param_imag_output_63)[i*4+0] = __xlx_imag_output_63_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_imag_output_63)[i*4+1] = __xlx_imag_output_63_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_imag_output_63)[i*4+2] = __xlx_imag_output_63_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_imag_output_63)[i*4+3] = __xlx_imag_output_63_output_buffer[i].range(31, 24).to_uint();
  }
}
