<AutoPilot:project xmlns:AutoPilot="com.autoesl.autopilot.project" projectType="C/C++" name="o_flow.prj" top="optical_flow">
    <Simulation argv="datasets/current/frame1.png datasets/current/frame2.png datasets/current/frame3.png datasets/current/frame4.png datasets/current/frame5.png out.flo datasets/current/ref.flo">
        <SimFlow name="csim" setup="false" optimizeCompile="false" clean="false" ldflags="-lpng" mflags=""/>
    </Simulation>
    <includePaths/>
    <libraryFlag/>
    <files>
        <file name="../../datasets" sc="0" tb="1" cflags=" "/>
        <file name="../../optical_flow_test.cpp" sc="0" tb="1" cflags=" -lpng"/>
        <file name="../../imageLib/Convert.cpp" sc="0" tb="1" cflags=" -lpng"/>
        <file name="../../imageLib/Convolve.cpp" sc="0" tb="1" cflags=" -lpng"/>
        <file name="../../imageLib/flowIO.cpp" sc="0" tb="1" cflags=" -lpng"/>
        <file name="../../imageLib/Image.cpp" sc="0" tb="1" cflags=" -lpng"/>
        <file name="../../imageLib/ImageIO.cpp" sc="0" tb="1" cflags=" -lpng"/>
        <file name="../../imageLib/ImageIOpng.cpp" sc="0" tb="1" cflags=" -lpng"/>
        <file name="../../imageLib/RefCntMem.cpp" sc="0" tb="1" cflags=" -lpng"/>
        <file name="optical_flow.cpp" sc="0" tb="false" cflags=""/>
    </files>
    <solutions>
        <solution name="solution1" status=""/>
    </solutions>
</AutoPilot:project>

