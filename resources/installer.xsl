<?xml version="1.0" encoding="UTF-8"?>
<!--
 Copyright 2017 akashche at redhat.com

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:w="http://schemas.microsoft.com/wix/2006/wi" exclude-result-prefixes="w">
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="w:Directory[@Id='INSTALLDIR']">
        <Directory Id="INSTALLDIR" xmlns="http://schemas.microsoft.com/wix/2006/wi">
            <xsl:apply-templates select="@* | *"/>
            <Directory Id="_1940f429_d8de_4676_b8ef_bed4120d3f8d" Name="bin">
                <Component Id="_c47cd15d_ce53_4995_97f2_aea425846b5a" Guid="e83e893f-9495-4836-bf50-8e93c8685e6c" Win64="yes">
                    <File Id="_9a276680_fade_4472_8332_ed3f3489fba0" Name="javafxpackager.exe" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/bin/javafxpackager.exe"/>
                </Component>
                <Component Id="_153e322e_ee0b_4011_987f_5c0b1afd4eae" Guid="8ca0725e-6a5c-4dbf-9a51-5efe050257f2" Win64="yes">
                    <File Id="_b5c54dd0_047b_44f7_a04d_f4852a4b079b" Name="javapackager.exe" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/bin/javapackager.exe"/>
                </Component>
            </Directory>
            <Directory Id="_2fab1d15_9b89_41c4_9b33_0e88a5764590" Name="jre">
                <Directory Id="_87d82913_6840_48bc_a53a_cb7a94db5b48" Name="bin">
                    <Component Id="_1c02fb86_0597_49b5_ab6c_e68ab6fb39b5" Guid="c74cf5e9-5211-4e8e-907d-20b5f6878ae1" Win64="yes">
                        <File Id="_58b1e74e_1cb4_4870_9b70_6d61a1a5b7c8" Name="api-ms-win-core-console-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-console-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_4692c129_6f40_460f_bfb7_6ef675448fa0" Guid="94f8ddf9-2972-40a6-863e-41d830231208" Win64="yes">
                        <File Id="_9d7698f2_fcba_4af7_8e4b_290a4ababf30" Name="api-ms-win-core-datetime-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-datetime-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_176eeac4_08c2_4833_b38a_5fc864ae25c3" Guid="e54425c8-328e-42bd-b7ca-5fdc0ea998e6" Win64="yes">
                        <File Id="_bbc59303_65e4_4a66_8c3b_f92b48b3ea62" Name="api-ms-win-core-debug-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-debug-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_73ff5bcf_9529_4b34_b663_78fe7cede81e" Guid="8f93e99c-5278-4bc2-aa94-1f898df09ce1" Win64="yes">
                        <File Id="_b3db190d_b509_4c26_bc62_30a8d74b30ce" Name="api-ms-win-core-errorhandling-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-errorhandling-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_3156365f_f82a_4784_ac03_41cb8c294f37" Guid="e28228e5-768d-4e72-97ec-303d0ab03d54" Win64="yes">
                        <File Id="_4874a684_dbe2_4e37_8a9f_70bca773e49b" Name="api-ms-win-core-file-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-file-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_6962ef1c_d5b9_4381_a8a6_10b20c888509" Guid="7aeaec76-7ceb-4b56-9800-82b77eb0a2fe" Win64="yes">
                        <File Id="_f5544812_65eb_45ef_9ae9_3c479e63fc5b" Name="api-ms-win-core-file-l1-2-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-file-l1-2-0.dll"/>
                    </Component>
                    <Component Id="_efcd6849_7ffc_474c_88c4_885d791b68a1" Guid="496ea8cb-875c-448e-b86f-29e3b6364c5a" Win64="yes">
                        <File Id="_16187ecf_7fe4_4fe2_b3ee_560e3777d4ad" Name="api-ms-win-core-file-l2-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-file-l2-1-0.dll"/>
                    </Component>
                    <Component Id="_ad0ac7d0_2e9d_4ee9_98c3_18416a937648" Guid="05bd9e58-78ae-4dda-a5e3-cfec137dc05e" Win64="yes">
                        <File Id="_6cc65382_645f_405b_a8d3_7437d35e1aaa" Name="api-ms-win-core-handle-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-handle-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_292352fa_9e01_41a2_9986_2dbccdfc49c1" Guid="bdfeb68d-e05c-45b9-895e-25edf555acc2" Win64="yes">
                        <File Id="_8a60b870_7af5_45c1_959d_a54f6c0701a5" Name="api-ms-win-core-heap-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-heap-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_1a512a0b_e2ab_46d9_adf1_9702929e2487" Guid="beecce7b-4411-40b3-bd55-2e07781fa6f3" Win64="yes">
                        <File Id="_e4689015_f800_403b_8b10_ade1622b97c3" Name="api-ms-win-core-interlocked-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-interlocked-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_77ea1efc_4bec_45a8_a89c_f60027372ec4" Guid="45fa51c6-340d-416d-a750-1d15e1a730d0" Win64="yes">
                        <File Id="_bc2fe2df_bf54_45ac_854f_3ad2c11a398a" Name="api-ms-win-core-libraryloader-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-libraryloader-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_05fec843_9a56_4803_9f21_48b01c42de46" Guid="68c72cfa-a820-431a-b81c-6b04dbf95617" Win64="yes">
                        <File Id="_08edb894_233a_4a4c_9c1b_1102fbf0ed41" Name="api-ms-win-core-localization-l1-2-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-localization-l1-2-0.dll"/>
                    </Component>
                    <Component Id="_85c9023e_dd36_4ecf_81c1_5f8070638c3a" Guid="f3ad9d4e-8864-412b-a253-0ffb75ec0d49" Win64="yes">
                        <File Id="_5efcf91d_9b88_4281_8a40_364d78bfdb66" Name="api-ms-win-core-memory-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-memory-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_97b94e28_ca46_470d_9412_a710ba46f1f4" Guid="d5de122f-7d0f-4b6e-b2f7-5926c781aa60" Win64="yes">
                        <File Id="_0d019274_0368_44de_8f93_da4c02f16ca6" Name="api-ms-win-core-namedpipe-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-namedpipe-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_9b5c5755_dfe3_450f_95d8_206122457c38" Guid="80f7ff5c-82f0-4414-a29d-3924b08b8985" Win64="yes">
                        <File Id="_eafa4190_59bc_4b05_b7aa_49b52825b10e" Name="api-ms-win-core-processenvironment-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-processenvironment-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_b8e11ab2_a50c_409b_82a5_98bf1b702dd8" Guid="c38f2009-d67c-407b-8960-31a15cf6a987" Win64="yes">
                        <File Id="_a8911efc_d05e_41a3_96c1_288970827837" Name="api-ms-win-core-processthreads-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-processthreads-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_f0f7807a_2666_4838_bd2c_eb75be5e3e2a" Guid="6f25b0bc-1b49-47a4-a980-ec3635de556b" Win64="yes">
                        <File Id="_efdb28ac_9789_4076_8a19_d54ec62a8ea9" Name="api-ms-win-core-processthreads-l1-1-1.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-processthreads-l1-1-1.dll"/>
                    </Component>
                    <Component Id="_f0aa3ba5_6d68_40bb_8bc6_22c37cad0a7e" Guid="a3652726-8987-4851-9cbc-f2976ad8d36b" Win64="yes">
                        <File Id="_2b9eba38_940d_4125_b732_dc0cc2642bd8" Name="api-ms-win-core-profile-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-profile-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_91c7527a_3a98_48bb_a13e_adbe13972bd3" Guid="95498631-9ed7-4680-bd16-6218a568511e" Win64="yes">
                        <File Id="_aaa0627c_f3c3_49ef_9fe5_7bafb619f4f3" Name="api-ms-win-core-rtlsupport-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-rtlsupport-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_5eb6703b_dd3d_4d2a_ab29_4bcff2c26ea5" Guid="a46aee2c-542a-4f72-b0dd-411c33be6d85" Win64="yes">
                        <File Id="_7db52c3d_ea19_4807_af62_29434a576c0a" Name="api-ms-win-core-string-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-string-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_5a6454f9_cbb1_4fea_aeed_501b4d96717e" Guid="76c3b031-38d8-4a0c-a9d7-666f2e36e53b" Win64="yes">
                        <File Id="_b4b39161_34b4_4350_b84e_c0294ab09772" Name="api-ms-win-core-synch-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-synch-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_bbc008af_979b_4790_8499_121ac8735e3c" Guid="34b4f7d7-b18c-470b-997a-834458207f7f" Win64="yes">
                        <File Id="_74e279be_1b7f_45a9_8c19_b49d0ab690bc" Name="api-ms-win-core-synch-l1-2-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-synch-l1-2-0.dll"/>
                    </Component>
                    <Component Id="_818a39b0_733c_4f2d_b30f_afc6f86cbd3c" Guid="d087e47b-60ca-4edf-8cca-e46612dd3a21" Win64="yes">
                        <File Id="_ea642d08_220b_4637_b706_e2012e7723d3" Name="api-ms-win-core-sysinfo-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-sysinfo-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_c0eae8dd_ce94_43f3_891f_ade779932555" Guid="b7b725bd-8654-46b0-9335-508e8a6493ea" Win64="yes">
                        <File Id="_f3360d02_5891_41dc_9d8e_7d1c12b243ec" Name="api-ms-win-core-timezone-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-timezone-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_933d9be7_6f63_4bc9_a2d0_2696c5187cb8" Guid="5ffde0ba-da39-4514-ab32-ed345ebc1a36" Win64="yes">
                        <File Id="_9bb0f879_b714_415d_a310_a48ba98ecfcc" Name="api-ms-win-core-util-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-core-util-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_d6ccd16f_fba5_4b71_8c64_63488b57fe16" Guid="44e1388b-5f62-46c6-ba87-19d9abda60d0" Win64="yes">
                        <File Id="_842b68a2_24ba_400f_80a3_9dfff2504ad7" Name="api-ms-win-crt-conio-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-crt-conio-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_3501fb79_222c_4469_b132_a533e02aee50" Guid="00079aaf-5615-4e77-9b3d-3a84fddf1c5a" Win64="yes">
                        <File Id="_6196af31_c493_43ef_8154_ccb56f003868" Name="api-ms-win-crt-convert-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-crt-convert-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_583a6b2f_bb9c_4327_b7c1_9d7b41e57cd8" Guid="6a37bfe8-e03b-4d03-aa73-4c286e23bcde" Win64="yes">
                        <File Id="_5e872efb_c564_43dd_9720_aba603b295c4" Name="api-ms-win-crt-environment-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-crt-environment-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_98d23e8f_9af9_4508_8706_b3178f3af8aa" Guid="d6cfd0aa-6a94-448f-b14b-aa719fa8c43f" Win64="yes">
                        <File Id="_680995e1_e4bf_42a1_ad11_b609bc276751" Name="api-ms-win-crt-filesystem-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-crt-filesystem-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_6705d6a6_17d8_4382_9d69_705c5a6dc5e3" Guid="7a5cc3f1-aa4c-43de-bc0f-24cf29f3bd2d" Win64="yes">
                        <File Id="_4c97aa63_8a36_4980_8b9e_adb1c382424f" Name="api-ms-win-crt-heap-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-crt-heap-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_ac3e2e35_d164_4a8f_a925_da9401c1496c" Guid="1bf6b9f1-c17c-408c-9a82-e233898e0393" Win64="yes">
                        <File Id="_91b1a687_6b2f_4533_9067_df724a8a44ca" Name="api-ms-win-crt-locale-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-crt-locale-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_04754e88_f0d7_4111_a104_9b35af3d2bd6" Guid="52008c62-36f2-4b11-9833-fb6e2ea82382" Win64="yes">
                        <File Id="_68458fa6_d1e1_4791_85a3_4e63e996eeaf" Name="api-ms-win-crt-math-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-crt-math-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_6640f058_d5c0_4510_be6c_ea5176e9d4d2" Guid="cced69c4-b6ce-4d01-94e8-64f9fb335e96" Win64="yes">
                        <File Id="_3f7e2f70_1436_450a_b287_e2c8bf2d823d" Name="api-ms-win-crt-multibyte-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-crt-multibyte-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_20778ffd_5b36_4244_8dec_0c92bc119cf7" Guid="43ba9935-da38-4b4c-9bc7-b740b4bfeb02" Win64="yes">
                        <File Id="_1ee0042f_154f_4871_8062_4e484ecffe1d" Name="api-ms-win-crt-private-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-crt-private-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_54ada888_20d5_46aa_b61e_bc116ca6e7ac" Guid="6d7a4381-ce3f-4ef7-b6ed-45eb641920c4" Win64="yes">
                        <File Id="_503ab704_f987_4ba4_9aa1_8a88f48af30f" Name="api-ms-win-crt-process-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-crt-process-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_0a461462_4e0c_448b_bc6e_32ea0a2d74e2" Guid="14d6c738-81d2-410e-aa65-3dd67f5fa86e" Win64="yes">
                        <File Id="_f811cec6_e946_4eb9_bfe1_3ba5825c2162" Name="api-ms-win-crt-runtime-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-crt-runtime-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_3b7c575d_4237_4f44_97b0_d662bdda9ef2" Guid="3e5828d4-e3c6-4a0c-8320-b89a544b15e7" Win64="yes">
                        <File Id="_3d951d02_ac1b_4b90_8ce8_8baf56f6ee20" Name="api-ms-win-crt-stdio-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-crt-stdio-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_f475c8d6_a804_4717_9068_8d7d99f7db76" Guid="cce7d14d-e144-4f5a-b8a6-2e43adb1d7b2" Win64="yes">
                        <File Id="_2a673117_a0c6_42d0_8fce_b28bd30c2a74" Name="api-ms-win-crt-string-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-crt-string-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_6c83093b_5e43_47ff_b299_0b4c4c335de0" Guid="45d943aa-f434-46a5-bb30-434dfd1f9833" Win64="yes">
                        <File Id="_88b83f18_1f2b_46ee_8f4c_494d3bda2e1f" Name="api-ms-win-crt-time-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-crt-time-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_c53b0150_9aca_4aa7_b13d_ae7dd16e0f92" Guid="dd371443-aa0a-47c9-bf33-7c4372ef1f81" Win64="yes">
                        <File Id="_8bd5b376_ccd4_4fd3_a9e1_9b5a83c1e074" Name="api-ms-win-crt-utility-l1-1-0.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/api-ms-win-crt-utility-l1-1-0.dll"/>
                    </Component>
                    <Component Id="_fa9b87c1_a734_4a3f_a269_ef61f2fa91a6" Guid="76ebded5-ff06-4e6a-bc2c-69d060920f45" Win64="yes">
                        <File Id="_475b3967_54c1_4c7f_9f5e_13e1a7245388" Name="concrt140.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/concrt140.dll"/>
                    </Component>
                    <Component Id="_c1a3d169_5bb8_44c8_86f0_9c3f3c7cff0c" Guid="658d0596-d651-44ce-bdd1-95682520ea7a" Win64="yes">
                        <File Id="_44a13c81_5ce8_4623_ad71_5a7f3c4fcb68" Name="decora_sse.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/decora_sse.dll"/>
                    </Component>
                    <Component Id="_b6985849_50cc_4bda_a3a2_e49c53883960" Guid="3e0a1031-d796-48ee-bc8e-354f2b008297" Win64="yes">
                        <File Id="_3df260ab_5d20_4632_be14_6cdcd85de4f4" Name="fxplugins.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/fxplugins.dll"/>
                    </Component>
                    <Component Id="_abb977b3_7048_4c89_b6fa_25fb6ca10c00" Guid="7a5ce879-e3bf-4e39-9b24-1122b3edab0b" Win64="yes">
                        <File Id="_82c9e8f6_e3bd_419c_81c4_f8f1d62cc798" Name="glass.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/glass.dll"/>
                    </Component>
                    <Component Id="_60dc80f7_e818_4687_b93c_a714f46668d3" Guid="f590ee27-f75b-423a-99d7-b253fac2ad4d" Win64="yes">
                        <File Id="_7d93da93_805e_4f9f_8f74_ef081fc57246" Name="glib-lite.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/glib-lite.dll"/>
                    </Component>
                    <Component Id="_24e001ce_9749_426b_8bb0_a960fe471f46" Guid="30903df1-ea4d-4c21-808b-27738e53f516" Win64="yes">
                        <File Id="_1d109d91_212d_4859_8d29_964b2cfd6973" Name="gstreamer-lite.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/gstreamer-lite.dll"/>
                    </Component>
                    <Component Id="_bd364e09_4f6d_4977_bb15_ee1db7c253b0" Guid="e21c4a12-3b2c-444a-bf84-d4c02899cc91" Win64="yes">
                        <File Id="_ac21d793_ceb1_435c_87f7_29bf0e7bb867" Name="javafx_font.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/javafx_font.dll"/>
                    </Component>
                    <Component Id="_49037503_ff41_49a0_bb9c_247955b0ea9d" Guid="f16ebd42-4e4e-4d8e-a39a-956c81fe7e5a" Win64="yes">
                        <File Id="_3fe15fa3_d1e9_468b_a8dc_544db2a4dcae" Name="javafx_iio.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/javafx_iio.dll"/>
                    </Component>
                    <Component Id="_41da6e77_03a7_4836_b7a1_2b95ed74288f" Guid="5b7ddece-4f93-4db2-a85f-7ff021da4bb1" Win64="yes">
                        <File Id="_759b658f_f0bf_4c3b_9db6_65aefa18c326" Name="jfxmedia.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/jfxmedia.dll"/>
                    </Component>
                    <Component Id="_18cf09b0_b94d_4cfa_8404_ed53c69edefd" Guid="daf2c344-da5b-4180-916e-aab1c8b8054f" Win64="yes">
                        <File Id="_b5fbb879_9497_46aa_a308_a32bc02ebd49" Name="jfxwebkit.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/jfxwebkit.dll"/>
                    </Component>
                    <Component Id="_8644ac78_9eae_4754_b591_417134a55d60" Guid="02a3964b-0ccf-4d66-870d-475b04af9d8b" Win64="yes">
                        <File Id="_608a20cf_42b7_4a1c_9acb_4bbfa43f4281" Name="msvcp140.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/msvcp140.dll"/>
                    </Component>
                    <Component Id="_88c142c8_94e9_4960_b3a3_b8547d040e35" Guid="1ec35f5d-cdec-4244-a3ef-42e2a90f0a2d" Win64="yes">
                        <File Id="_5859478d_c885_4471_9907_521f3ebcd1ce" Name="prism_common.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/prism_common.dll"/>
                    </Component>
                    <Component Id="_ba4282da_dba0_460a_b7f5_df195e53335b" Guid="e7d921bd-ac1b-4af6-9422-eb5a94777a2d" Win64="yes">
                        <File Id="_4f57b76f_f490_4040_b6fb_f44c57e0dbc4" Name="prism_d3d.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/prism_d3d.dll"/>
                    </Component>
                    <Component Id="_e7738a21_13a0_4b2b_ad97_078e52edba75" Guid="90eac1fd-66b4-4856-b0f7-eb7e02c0efa7" Win64="yes">
                        <File Id="_b2426c27_cf9d_439e_ae96_a731de6484df" Name="prism_sw.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/prism_sw.dll"/>
                    </Component>
                    <Component Id="_3370bd21_46fc_41ba_a852_4fbf89285816" Guid="9fb3da44-fa1e-4f20-8c42-e9eb977f381b" Win64="yes">
                        <File Id="_a438b7f1_cfc9_404d_bc1a_6d4ece5879f4" Name="ucrtbase.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/ucrtbase.dll"/>
                    </Component>
                    <Component Id="_866bf339_cdef_4c0c_ade0_22a9aa54a62a" Guid="08ff4f3f-d9c7-48d9-aa04-f4837cdbdb5e" Win64="yes">
                        <File Id="_39b02da3_426d_42c9_956f_f26ca78c11c1" Name="vcruntime140.dll" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/bin/vcruntime140.dll"/>
                    </Component>
                </Directory>
                <Directory Id="_791a1f5d_3545_4023_8db6_cfddbccd3c6b" Name="lib">
                    <Directory Id="_2d9374dc_1024_46b8_ae4c_b39be3b5bc05" Name="ext">
                        <Component Id="_c671a2c2_8c69_4112_83df_36a409fa6bb6" Guid="4c103f2e-913a-4b7c-b8da-88655cf8bce1" Win64="yes">
                            <File Id="_601bfecf_42a0_4f60_9d91_0a193922b226" Name="jfxrt.jar" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/lib/ext/jfxrt.jar"/>
                        </Component>
                    </Directory>
                    <Component Id="_167e8952_7617_4524_a44f_02a0ca24510f" Guid="301c79a3-4c3c-4091-98ff-cad42723b6b6" Win64="yes">
                        <File Id="_bd4a5c2a_56a9_4605_8529_c79bad5a0bd4" Name="javafx.properties" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/lib/javafx.properties"/>
                    </Component>
                    <Component Id="_70fc8263_4e5d_483a_9b8e_e1368c98e76f" Guid="b569d6b3-ce3a-4bb1-aacf-4da96c8bc606" Win64="yes">
                        <File Id="_5f254d7b_3e68_45f7_8a37_06a555c54f5f" Name="jfxswt.jar" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/jre/lib/jfxswt.jar"/>
                    </Component>
                </Directory>
            </Directory>
            <Directory Id="_c9bdee8b_fd7e_4cd6_a0fe_b1b8d46d7e23" Name="lib">
                <Component Id="_09279d71_936e_47f9_9666_87b18b0468c1" Guid="b3e5f365-1a84-49c3-ad34-27814c41c98c" Win64="yes">
                    <File Id="_95d09f7b_57ca_4e39_9793_705a17bec20f" Name="ant-javafx.jar" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/lib/ant-javafx.jar"/>
                </Component>
                <Component Id="_8ef24746_16f4_4142_81ff_d52bb5c71e8f" Guid="c54032d1-80ab-4016-9dad-1b3f51710220" Win64="yes">
                    <File Id="_caeaaa65_e0c1_4b59_89f0_03bfc2da9544" Name="javafx-mx.jar" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/lib/javafx-mx.jar"/>
                </Component>
                <Component Id="_150afed3_1e42_47b0_bf33_fe3100401af6" Guid="019e6a39-7be7-4c17-90a7-0e2e42c77055" Win64="yes">
                    <File Id="_5a9be24b_e9ce_4fd1_9d29_0b5177231a37" Name="packager.jar" KeyPath="yes" DiskId="1" Source="${CMAKE_CURRENT_BINARY_DIR}/${${PROJECT_NAME}_IMAGE}/lib/packager.jar"/>
                </Component>
            </Directory>
        </Directory>
    </xsl:template>
    <xsl:template match="w:Feature[@ConfigurableDirectory='INSTALLDIR']">
        <Feature Id="jdk" xmlns="http://schemas.microsoft.com/wix/2006/wi">
            <xsl:apply-templates select="@* | *"/>
        </Feature>
        <Feature Id="openjfx" Absent="allow" AllowAdvertise="no" Level="${${PROJECT_NAME}_INSTALLER_FEATURE_LEVEL}" 
                Title="${${PROJECT_NAME}_INSTALLER_FEATURE_TITLE}"
                Description="${${PROJECT_NAME}_INSTALLER_FEATURE_DESCRIPTION}"
                xmlns="http://schemas.microsoft.com/wix/2006/wi">
            <ComponentRef Id="_c47cd15d_ce53_4995_97f2_aea425846b5a"/>
            <ComponentRef Id="_153e322e_ee0b_4011_987f_5c0b1afd4eae"/>
            <ComponentRef Id="_1c02fb86_0597_49b5_ab6c_e68ab6fb39b5"/>
            <ComponentRef Id="_4692c129_6f40_460f_bfb7_6ef675448fa0"/>
            <ComponentRef Id="_176eeac4_08c2_4833_b38a_5fc864ae25c3"/>
            <ComponentRef Id="_73ff5bcf_9529_4b34_b663_78fe7cede81e"/>
            <ComponentRef Id="_3156365f_f82a_4784_ac03_41cb8c294f37"/>
            <ComponentRef Id="_6962ef1c_d5b9_4381_a8a6_10b20c888509"/>
            <ComponentRef Id="_efcd6849_7ffc_474c_88c4_885d791b68a1"/>
            <ComponentRef Id="_ad0ac7d0_2e9d_4ee9_98c3_18416a937648"/>
            <ComponentRef Id="_292352fa_9e01_41a2_9986_2dbccdfc49c1"/>
            <ComponentRef Id="_1a512a0b_e2ab_46d9_adf1_9702929e2487"/>
            <ComponentRef Id="_77ea1efc_4bec_45a8_a89c_f60027372ec4"/>
            <ComponentRef Id="_05fec843_9a56_4803_9f21_48b01c42de46"/>
            <ComponentRef Id="_85c9023e_dd36_4ecf_81c1_5f8070638c3a"/>
            <ComponentRef Id="_97b94e28_ca46_470d_9412_a710ba46f1f4"/>
            <ComponentRef Id="_9b5c5755_dfe3_450f_95d8_206122457c38"/>
            <ComponentRef Id="_b8e11ab2_a50c_409b_82a5_98bf1b702dd8"/>
            <ComponentRef Id="_f0f7807a_2666_4838_bd2c_eb75be5e3e2a"/>
            <ComponentRef Id="_f0aa3ba5_6d68_40bb_8bc6_22c37cad0a7e"/>
            <ComponentRef Id="_91c7527a_3a98_48bb_a13e_adbe13972bd3"/>
            <ComponentRef Id="_5eb6703b_dd3d_4d2a_ab29_4bcff2c26ea5"/>
            <ComponentRef Id="_5a6454f9_cbb1_4fea_aeed_501b4d96717e"/>
            <ComponentRef Id="_bbc008af_979b_4790_8499_121ac8735e3c"/>
            <ComponentRef Id="_818a39b0_733c_4f2d_b30f_afc6f86cbd3c"/>
            <ComponentRef Id="_c0eae8dd_ce94_43f3_891f_ade779932555"/>
            <ComponentRef Id="_933d9be7_6f63_4bc9_a2d0_2696c5187cb8"/>
            <ComponentRef Id="_d6ccd16f_fba5_4b71_8c64_63488b57fe16"/>
            <ComponentRef Id="_3501fb79_222c_4469_b132_a533e02aee50"/>
            <ComponentRef Id="_583a6b2f_bb9c_4327_b7c1_9d7b41e57cd8"/>
            <ComponentRef Id="_98d23e8f_9af9_4508_8706_b3178f3af8aa"/>
            <ComponentRef Id="_6705d6a6_17d8_4382_9d69_705c5a6dc5e3"/>
            <ComponentRef Id="_ac3e2e35_d164_4a8f_a925_da9401c1496c"/>
            <ComponentRef Id="_04754e88_f0d7_4111_a104_9b35af3d2bd6"/>
            <ComponentRef Id="_6640f058_d5c0_4510_be6c_ea5176e9d4d2"/>
            <ComponentRef Id="_20778ffd_5b36_4244_8dec_0c92bc119cf7"/>
            <ComponentRef Id="_54ada888_20d5_46aa_b61e_bc116ca6e7ac"/>
            <ComponentRef Id="_0a461462_4e0c_448b_bc6e_32ea0a2d74e2"/>
            <ComponentRef Id="_3b7c575d_4237_4f44_97b0_d662bdda9ef2"/>
            <ComponentRef Id="_f475c8d6_a804_4717_9068_8d7d99f7db76"/>
            <ComponentRef Id="_6c83093b_5e43_47ff_b299_0b4c4c335de0"/>
            <ComponentRef Id="_c53b0150_9aca_4aa7_b13d_ae7dd16e0f92"/>
            <ComponentRef Id="_fa9b87c1_a734_4a3f_a269_ef61f2fa91a6"/>
            <ComponentRef Id="_c1a3d169_5bb8_44c8_86f0_9c3f3c7cff0c"/>
            <ComponentRef Id="_b6985849_50cc_4bda_a3a2_e49c53883960"/>
            <ComponentRef Id="_abb977b3_7048_4c89_b6fa_25fb6ca10c00"/>
            <ComponentRef Id="_60dc80f7_e818_4687_b93c_a714f46668d3"/>
            <ComponentRef Id="_24e001ce_9749_426b_8bb0_a960fe471f46"/>
            <ComponentRef Id="_bd364e09_4f6d_4977_bb15_ee1db7c253b0"/>
            <ComponentRef Id="_49037503_ff41_49a0_bb9c_247955b0ea9d"/>
            <ComponentRef Id="_41da6e77_03a7_4836_b7a1_2b95ed74288f"/>
            <ComponentRef Id="_18cf09b0_b94d_4cfa_8404_ed53c69edefd"/>
            <ComponentRef Id="_8644ac78_9eae_4754_b591_417134a55d60"/>
            <ComponentRef Id="_88c142c8_94e9_4960_b3a3_b8547d040e35"/>
            <ComponentRef Id="_ba4282da_dba0_460a_b7f5_df195e53335b"/>
            <ComponentRef Id="_e7738a21_13a0_4b2b_ad97_078e52edba75"/>
            <ComponentRef Id="_3370bd21_46fc_41ba_a852_4fbf89285816"/>
            <ComponentRef Id="_866bf339_cdef_4c0c_ade0_22a9aa54a62a"/>
            <ComponentRef Id="_c671a2c2_8c69_4112_83df_36a409fa6bb6"/>
            <ComponentRef Id="_167e8952_7617_4524_a44f_02a0ca24510f"/>
            <ComponentRef Id="_70fc8263_4e5d_483a_9b8e_e1368c98e76f"/>
            <ComponentRef Id="_09279d71_936e_47f9_9666_87b18b0468c1"/>
            <ComponentRef Id="_8ef24746_16f4_4142_81ff_d52bb5c71e8f"/>
            <ComponentRef Id="_150afed3_1e42_47b0_bf33_fe3100401af6"/>
        </Feature>
    </xsl:template>
</xsl:stylesheet>
