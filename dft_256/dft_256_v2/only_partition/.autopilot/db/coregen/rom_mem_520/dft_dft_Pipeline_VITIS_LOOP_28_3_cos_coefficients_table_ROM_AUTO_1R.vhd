-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Tool Version Limit: 2022.04
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity dft_dft_Pipeline_VITIS_LOOP_28_3_cos_coefficients_table_ROM_AUTO_1R is 
    generic(
             DataWidth     : integer := 32; 
             AddressWidth     : integer := 8; 
             AddressRange    : integer := 256
    ); 
    port (
          address0      : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DataWidth-1 downto 0);
          reset     : in std_logic;
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of dft_dft_Pipeline_VITIS_LOOP_28_3_cos_coefficients_table_ROM_AUTO_1R is 

signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 
type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 
signal mem : mem_array := (
    0 => "00111111100000000000000000000000", 
    1 => "00111111011111111110110001000110", 
    2 => "00111111011111111011000100000111", 
    3 => "00111111011111110100111001100110", 
    4 => "00111111011111101100010001110010", 
    5 => "00111111011111100001001100101011", 
    6 => "00111111011111010011101010110100", 
    7 => "00111111011111000011101100101110", 
    8 => "00111111011110110001010010111010", 
    9 => "00111111011110011100011110011011", 
    10 => "00111111011110000101001111110100", 
    11 => "00111111011101101011101000000110", 
    12 => "00111111011101001111101000000101", 
    13 => "00111111011100110001010001000100", 
    14 => "00111111011100010000100100000111", 
    15 => "00111111011011101101100010100001", 
    16 => "00111111011011001000001101100110", 
    17 => "00111111011010100000100110101011", 
    18 => "00111111011001110110101111010011", 
    19 => "00111111011001001010101001010100", 
    20 => "00111111011000011100010110010011", 
    21 => "00111111010111101011111000000110", 
    22 => "00111111010110111001010000100001", 
    23 => "00111111010110000100100001011010", 
    24 => "00111111010101001101101100111000", 
    25 => "00111111010100010100110101000000", 
    26 => "00111111010011011001111100001010", 
    27 => "00111111010010011101000100001011", 
    28 => "00111111010001011110001111111100", 
    29 => "00111111010000011101100001110011", 
    30 => "00111111001111011010111011110111", 
    31 => "00111111001110010110100001000000", 
    32 => "00111111001101010000010011110111", 
    33 => "00111111001100001000010111000010", 
    34 => "00111111001010111110101101001010", 
    35 => "00111111001001110011011001011001", 
    36 => "00111111001000100110011110010100", 
    37 => "00111111000111010111111111011000", 
    38 => "00111111000110000111111110111011", 
    39 => "00111111000100110110100000100111", 
    40 => "00111111000011100011100111010110", 
    41 => "00111111000010001111010110100001", 
    42 => "00111111000000111001110001000001", 
    43 => "00111110111111000101110100100000", 
    44 => "00111110111100010101101011110011", 
    45 => "00111110111001100011001101101010", 
    46 => "00111110110110101110100001111101", 
    47 => "00111110110011110111101111000000", 
    48 => "00111110110000111110111100000111", 
    49 => "00111110101110000100010000101000", 
    50 => "00111110101011000111110011011001", 
    51 => "00111110101000001001101011101101", 
    52 => "00111110100101001010000000111100", 
    53 => "00111110100010001000111010011011", 
    54 => "00111110011110001100111111000000", 
    55 => "00111110011000000101110000000011", 
    56 => "00111110010001111100010110101100", 
    57 => "00111110001011110001000010101010", 
    58 => "00111110000101100100000001100100", 
    59 => "00111101111110101011001010011110", 
    60 => "00111101110010001011110100100011", 
    61 => "00111101100101101010100100111111", 
    62 => "00111101010010001111101110000111", 
    63 => "00111100110010010000101000110101", 
    64 => "00000000000000000000000000000000", 
    65 => "10111100110010010000101000110101", 
    66 => "10111101010010001111101110000111", 
    67 => "10111101100101101010100100111111", 
    68 => "10111101110010001011110100100011", 
    69 => "10111101111110101011001010011110", 
    70 => "10111110000101100100000001100100", 
    71 => "10111110001011110001000010101010", 
    72 => "10111110010001111100010110101100", 
    73 => "10111110011000000101110000000011", 
    74 => "10111110011110001100111111000000", 
    75 => "10111110100010001000111010011011", 
    76 => "10111110100101001010000000111100", 
    77 => "10111110101000001001101011101101", 
    78 => "10111110101011000111110011011001", 
    79 => "10111110101110000100010000101000", 
    80 => "10111110110000111110111100000111", 
    81 => "10111110110011110111101111000000", 
    82 => "10111110110110101110100001111101", 
    83 => "10111110111001100011001101101010", 
    84 => "10111110111100010101101011110011", 
    85 => "10111110111111000101110100100000", 
    86 => "10111111000000111001110001000001", 
    87 => "10111111000010001111010110100001", 
    88 => "10111111000011100011100111010110", 
    89 => "10111111000100110110100000100111", 
    90 => "10111111000110000111111110111011", 
    91 => "10111111000111010111111111011000", 
    92 => "10111111001000100110011110010100", 
    93 => "10111111001001110011011001011001", 
    94 => "10111111001010111110101101001010", 
    95 => "10111111001100001000010111000010", 
    96 => "10111111001101010000010011110111", 
    97 => "10111111001110010110100001000000", 
    98 => "10111111001111011010111011110111", 
    99 => "10111111010000011101100001110011", 
    100 => "10111111010001011110001111111100", 
    101 => "10111111010010011101000100001011", 
    102 => "10111111010011011001111100001010", 
    103 => "10111111010100010100110101000000", 
    104 => "10111111010101001101101100111000", 
    105 => "10111111010110000100100001011010", 
    106 => "10111111010110111001010000100001", 
    107 => "10111111010111101011111000000110", 
    108 => "10111111011000011100010110010011", 
    109 => "10111111011001001010101001010100", 
    110 => "10111111011001110110101111010011", 
    111 => "10111111011010100000100110101011", 
    112 => "10111111011011001000001101100110", 
    113 => "10111111011011101101100010100001", 
    114 => "10111111011100010000100100000111", 
    115 => "10111111011100110001010001000100", 
    116 => "10111111011101001111101000000101", 
    117 => "10111111011101101011101000000110", 
    118 => "10111111011110000101001111110100", 
    119 => "10111111011110011100011110011011", 
    120 => "10111111011110110001010010111010", 
    121 => "10111111011111000011101100101110", 
    122 => "10111111011111010011101010110100", 
    123 => "10111111011111100001001100101011", 
    124 => "10111111011111101100010001110010", 
    125 => "10111111011111110100111001100110", 
    126 => "10111111011111111011000100000111", 
    127 => "10111111011111111110110001000110", 
    128 => "10111111100000000000000000000000", 
    129 => "10111111011111111110110001000110", 
    130 => "10111111011111111011000100000111", 
    131 => "10111111011111110100111001100110", 
    132 => "10111111011111101100010001110010", 
    133 => "10111111011111100001001100101011", 
    134 => "10111111011111010011101010110100", 
    135 => "10111111011111000011101100101110", 
    136 => "10111111011110110001010010111010", 
    137 => "10111111011110011100011110011011", 
    138 => "10111111011110000101001111110100", 
    139 => "10111111011101101011101000000110", 
    140 => "10111111011101001111101000000101", 
    141 => "10111111011100110001010001000100", 
    142 => "10111111011100010000100100000111", 
    143 => "10111111011011101101100010100001", 
    144 => "10111111011011001000001101100110", 
    145 => "10111111011010100000100110101011", 
    146 => "10111111011001110110101111010011", 
    147 => "10111111011001001010101001010100", 
    148 => "10111111011000011100010110010011", 
    149 => "10111111010111101011111000000110", 
    150 => "10111111010110111001010000100001", 
    151 => "10111111010110000100100001011010", 
    152 => "10111111010101001101101100111000", 
    153 => "10111111010100010100110101000000", 
    154 => "10111111010011011001111100001010", 
    155 => "10111111010010011101000100001011", 
    156 => "10111111010001011110001111111100", 
    157 => "10111111010000011101100001110011", 
    158 => "10111111001111011010111011110111", 
    159 => "10111111001110010110100001000000", 
    160 => "10111111001101010000010011110111", 
    161 => "10111111001100001000010111000010", 
    162 => "10111111001010111110101101001010", 
    163 => "10111111001001110011011001011001", 
    164 => "10111111001000100110011110010100", 
    165 => "10111111000111010111111111011000", 
    166 => "10111111000110000111111110111011", 
    167 => "10111111000100110110100000100111", 
    168 => "10111111000011100011100111010110", 
    169 => "10111111000010001111010110100001", 
    170 => "10111111000000111001110001000001", 
    171 => "10111110111111000101110100100000", 
    172 => "10111110111100010101101011110011", 
    173 => "10111110111001100011001101101010", 
    174 => "10111110110110101110100001111101", 
    175 => "10111110110011110111101111000000", 
    176 => "10111110110000111110111100000111", 
    177 => "10111110101110000100010000101000", 
    178 => "10111110101011000111110011011001", 
    179 => "10111110101000001001101011101101", 
    180 => "10111110100101001010000000111100", 
    181 => "10111110100010001000111010011011", 
    182 => "10111110011110001100111111000000", 
    183 => "10111110011000000101110000000011", 
    184 => "10111110010001111100010110101100", 
    185 => "10111110001011110001000010101010", 
    186 => "10111110000101100100000001100100", 
    187 => "10111101111110101011001010011110", 
    188 => "10111101110010001011110100100011", 
    189 => "10111101100101101010100100111111", 
    190 => "10111101010010001111101110000111", 
    191 => "10111100110010010000101000110101", 
    192 => "10000000000000000000000000000000", 
    193 => "00111100110010010000101000110101", 
    194 => "00111101010010001111101110000111", 
    195 => "00111101100101101010100100111111", 
    196 => "00111101110010001011110100100011", 
    197 => "00111101111110101011001010011110", 
    198 => "00111110000101100100000001100100", 
    199 => "00111110001011110001000010101010", 
    200 => "00111110010001111100010110101100", 
    201 => "00111110011000000101110000000011", 
    202 => "00111110011110001100111111000000", 
    203 => "00111110100010001000111010011011", 
    204 => "00111110100101001010000000111100", 
    205 => "00111110101000001001101011101101", 
    206 => "00111110101011000111110011011001", 
    207 => "00111110101110000100010000101000", 
    208 => "00111110110000111110111100000111", 
    209 => "00111110110011110111101111000000", 
    210 => "00111110110110101110100001111101", 
    211 => "00111110111001100011001101101010", 
    212 => "00111110111100010101101011110011", 
    213 => "00111110111111000101110100100000", 
    214 => "00111111000000111001110001000001", 
    215 => "00111111000010001111010110100001", 
    216 => "00111111000011100011100111010110", 
    217 => "00111111000100110110100000100111", 
    218 => "00111111000110000111111110111011", 
    219 => "00111111000111010111111111011000", 
    220 => "00111111001000100110011110010100", 
    221 => "00111111001001110011011001011001", 
    222 => "00111111001010111110101101001010", 
    223 => "00111111001100001000010111000010", 
    224 => "00111111001101010000010011110111", 
    225 => "00111111001110010110100001000000", 
    226 => "00111111001111011010111011110111", 
    227 => "00111111010000011101100001110011", 
    228 => "00111111010001011110001111111100", 
    229 => "00111111010010011101000100001011", 
    230 => "00111111010011011001111100001010", 
    231 => "00111111010100010100110101000000", 
    232 => "00111111010101001101101100111000", 
    233 => "00111111010110000100100001011010", 
    234 => "00111111010110111001010000100001", 
    235 => "00111111010111101011111000000110", 
    236 => "00111111011000011100010110010011", 
    237 => "00111111011001001010101001010100", 
    238 => "00111111011001110110101111010011", 
    239 => "00111111011010100000100110101011", 
    240 => "00111111011011001000001101100110", 
    241 => "00111111011011101101100010100001", 
    242 => "00111111011100010000100100000111", 
    243 => "00111111011100110001010001000100", 
    244 => "00111111011101001111101000000101", 
    245 => "00111111011101101011101000000110", 
    246 => "00111111011110000101001111110100", 
    247 => "00111111011110011100011110011011", 
    248 => "00111111011110110001010010111010", 
    249 => "00111111011111000011101100101110", 
    250 => "00111111011111010011101010110100", 
    251 => "00111111011111100001001100101011", 
    252 => "00111111011111101100010001110010", 
    253 => "00111111011111110100111001100110", 
    254 => "00111111011111111011000100000111", 
    255 => "00111111011111111110110001000110" );


begin 


memory_access_guard_0: process (address0) 
begin
      address0_tmp <= address0;
--synthesis translate_off
      if (CONV_INTEGER(address0) > AddressRange-1) then
           address0_tmp <= (others => '0');
      else 
           address0_tmp <= address0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(address0_tmp)); 
        end if;
    end if;
end process;

end rtl;

