<project xmlns="com.autoesl.autopilot.project" top="dft" name="dft_256_v2">
    <includePaths/>
    <libraryPaths/>
    <Simulation>
        <SimFlow name="csim" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <files xmlns="">
        <file name="../out.gold.dat" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../dft_test.cpp" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="dft_256_v2/dft.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="dft_256_v2/dft.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="dft_256_v2/coefficients256.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="solution1" status="inactive"/>
        <solution name="solution2" status="inactive"/>
        <solution name="dataflow_1" status="active"/>
        <solution name="only_unroll" status="inactive"/>
        <solution name="only_partition" status="inactive"/>
    </solutions>
</project>

