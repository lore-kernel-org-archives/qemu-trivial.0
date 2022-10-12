Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oii22-00019d-Vw
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2022 16:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <benoitdudu38@hotmail.fr>)
 id 1oigWs-0006Iu-Id
 for qemu-trivial@nongnu.org; Wed, 12 Oct 2022 14:32:32 -0400
Received: from mail-db8eur05olkn20802.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::802]:5134
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <benoitdudu38@hotmail.fr>)
 id 1oigWq-0003hp-SU
 for qemu-trivial@nongnu.org; Wed, 12 Oct 2022 14:32:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGTHtN8mNkb7DfYUWFbxx/sJyMT+s2zl9yLyS/6AN3DvdVB5/5lr2nW67wyF1HY2vT+A1D0G2kb7n3cXNNnzWdejrFzz1wJrMO7pfxgeGPJtN/IwUSsEeGI04WOz6WdLWTcXlwR+7XLW3325+zBdesAkJaJdvBR53t5OFUjhV2XdHCkyjIYzs7vr1aRDNzCEtACwG/cenUcRi60uNq5R/MMHxjRk/IUlmytvV+hYydy1jtAEi/x3P73dKG2VY4EmjW0Eov0eIdU9sBHORp/Tx1AVIdrlVrf8K41fxHsHFWx5MhzhDRs4H2gvATM/q7gSM0sQMuFRhW3c4W0duC0Q/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSlx0dcJ2a4ufwIBppeisTsmRMP0hVyy2IJOVzpQfEM=;
 b=MZLPa/bv1mtxEGQ1EMOn6PFIysY2zMmGEssHYyBheTklLVPanmn0hmi+VvQb1vee5/w7F3G2XQqLKq9Npu91SqnBbMQM8bbxO527c7mcrOeqMPuE3f3l7mkhot/k2t+g7FLGAkv+E3HQYSx1vULU4ejEzO0FZX2x+o6XYKPA2TVtRqyz3DbIWAyGU4AoI659QRTuSpcMtHjEGW4apTCtdtevVByMvW1dgNM5wS/370ZSRXWoALso6ewp7m/KbzKHcz+qrUwlxlhwVEQn+SqaqB9XD570W8WK/tVdEWtcGdSY1iga1A1s/JbwQFKNim2vLI5flhIorwpkl8qFXUluxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from PR3PR07MB6761.eurprd07.prod.outlook.com (2603:10a6:102:70::12)
 by DB9PR07MB7260.eurprd07.prod.outlook.com (2603:10a6:10:21c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.20; Wed, 12 Oct
 2022 18:27:23 +0000
Received: from PR3PR07MB6761.eurprd07.prod.outlook.com
 ([fe80::228e:3882:7dbb:4c14]) by PR3PR07MB6761.eurprd07.prod.outlook.com
 ([fe80::228e:3882:7dbb:4c14%4]) with mapi id 15.20.5723.020; Wed, 12 Oct 2022
 18:27:23 +0000
From: <benoitdudu38@hotmail.fr>
To: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: GCC9 compilation warning treated as error
Thread-Topic: GCC9 compilation warning treated as error
Thread-Index: AQHY3mccir+w+fGwo0OvxkLYuxbiWw==
Date: Wed, 12 Oct 2022 18:27:23 +0000
Message-ID: <PR3PR07MB676110594DCDCA29B33704ABE2229@PR3PR07MB6761.eurprd07.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [OcFY1Hj8BZ+udVrE4r73E5XAYwSVxWyexDEi1BjPuRWzmY49qL7GMFPgCraoZ5Od]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR07MB6761:EE_|DB9PR07MB7260:EE_
x-ms-office365-filtering-correlation-id: 70c00447-2766-452b-5d41-08daac7f6821
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lxs6Qrt6IdS6dU1qB/AzVDod0DTu3ost/Pff+thzU7Xkeu6BciLcQVKCKJZmPptQlvLUHK/1MVSPjifxnEBwYtgP9/lQWuK1JcjbKEgPBuato1H0Byr44O2ECK/1pT4n5xB2BE2p7lXqjaRDSn0JdrJmGTARX9PudmC1i3aIbNuLtUGRhos7JxyMkcYiEiP9q9FLp16SPSsZEz6cCdq7gbBLlaE1HexZh4KiCDJAsNZr17vu360LuU5MwOZpaG/8d5D/3SAHlBxr4+Cl74QXnc/4F4x2YnRCcjT4mg/KuIHm9EXjiLl+0VZJrW95nL1GartX3BJkbhrs4AcQwEa3T6SbVUOckZNNDCVRN4tYy9nDZ4Z68BUa12NFGTY5xHC1pCBziLOl1rsAt1I3UywyGezximCV8JhM8KsGbuC60ynYu7a8SS5/Pd6aF3FluElvzs/msqc6PAE2qLamrc12BmiKDvTc/vjidfS1ws0o/I+Z5k1IVVkH80pODfGXvn94/Ac/dV4RmYl2YNRpDLaOSJ05mEoEv6dOx69bRtscJoGjY+IkcdsDMcDcokwCNTOSVb6y/wXY2f/ooHs5NN/nkYWxbYsJYktRrTTiLyFSiz1R0fcJVzmiBCHtkTof9FPOCVyBdJzs8rILWUMBH3enlA==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?UkyC6WaLAl4G48OeK7vjsTT+WIZiBTb3BltKPBOV5rFWdC2h2y4aCZJ3Tq?=
 =?iso-8859-1?Q?wB4STdI6/SUGnwGFiiTPufmnmAP1YOMTi6AY60SakHU0jUm4wQnUK+5waq?=
 =?iso-8859-1?Q?qB9Y2Dgx261WTRlyXNoMpvWqiDCehlXixJ+gR0FX1+WiqedwATpqdD9/sr?=
 =?iso-8859-1?Q?/kP3Q5n2UxS2eTjoCwYwvacSE0VRrYVsjPbth0N0TpiXESiut3QNbh5kn3?=
 =?iso-8859-1?Q?JktOdGmg58IpnzCoAGgU7NzYiVHPEgG4cad9U1dBaSMhjJkaSCc4wHvIk/?=
 =?iso-8859-1?Q?gfpKUJT4guCPIt0/5Ba+YruoNGhEXewNnOUNtlRTup1ig3QD4IkQuQ0hDK?=
 =?iso-8859-1?Q?ZeAEAvdNr2LzmDUpXuLUuv8gXw+LEtWth+fuTUxauiD6agk1xlj1IOHme8?=
 =?iso-8859-1?Q?AFKaXVYh3yfIXhfsKJ2ObbPQ9wRa0SiE+wumxDIz2Sr0SYjH4Wo0ADAOTH?=
 =?iso-8859-1?Q?f1MhhrR19goNQulnuXQu6uY9lmuH7doGWmD4vCD7rHDlYR3oSapu4rtnZi?=
 =?iso-8859-1?Q?+3grs0DFVqZfLxmAYD9Hiw4Ca7Hg4UJQA0lXfldUEueHSJeP3QSi/+OpME?=
 =?iso-8859-1?Q?sm86S3iHytzL6oVBNdGHZ45g+ns0tCTm2wJrSL1vVSxgRGOWETukh4KFdP?=
 =?iso-8859-1?Q?ihEFYeVhaSA16ei+mt6KzmSYNJ2vHzrLODBK9Yi78M8zu3pSC/iClp3McL?=
 =?iso-8859-1?Q?mwF4Tb+U4uLNrK0oNKW9J1igb8BMHZQwpVV7+q45OE7A31eZ/pgVsl4U7K?=
 =?iso-8859-1?Q?ZPIhdK5ZOt0iHAXWOMJVR5j+VxVFrpYy/YXHcY6UEeGY9jmCt+8pdSAPI8?=
 =?iso-8859-1?Q?oJ9wEEyhyCcRASdidfsdIRqGr1udSLfAfx/FkrvFB/+TMWQecmJu2WUyv4?=
 =?iso-8859-1?Q?+DUVU208X9peYwyjI4xRBTZjTyzxGTho3EHZMlF4GavoVqnL3LSDAVG+V9?=
 =?iso-8859-1?Q?b8YQRhIMIDF5eRBcRDL2qxztHOcdq26w9v4uTfMUFlmo1200orBk2cVONz?=
 =?iso-8859-1?Q?Xbd6BJMgFuqdcF3TbeNR7xm7UilBInLia30q6GvalrQw4JQxLe/rnsJFgx?=
 =?iso-8859-1?Q?FyVrq2Yo9rNMTJMs/PLSOYQBZJDzF80DJMM/ePQqIgjemJDMaKMHdSEjae?=
 =?iso-8859-1?Q?Z5XQ2KAkj7JtTuKorHAQ4obr7f1ctVqnSp1gdSJIBHGl+TrBWrV1ewymxF?=
 =?iso-8859-1?Q?vg5v4eE55JYABhKyAeNz7dWc9MurAhld+36ZJBk8DNJkQABCPNZ3xK6Zd6?=
 =?iso-8859-1?Q?ssdApcvICMQJyG+WCefudQA3TnpUdKpuYUFpmB7u+8ustzTnbUra7TnHze?=
 =?iso-8859-1?Q?ToYyR6tYs1TSR878rmupeo2PsvbQrLw0OD5MZmI6J4R1iH8dVcN7ad6QD6?=
 =?iso-8859-1?Q?6ZkNdDCWF7ou9hawU8rVBsFIMtkENpKA=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_PR3PR07MB676110594DCDCA29B33704ABE2229PR3PR07MB6761eurp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4778-2-msonline-outlook-1105a.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR07MB6761.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c00447-2766-452b-5d41-08daac7f6821
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2022 18:27:23.3875 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB7260
Received-SPF: pass client-ip=2a01:111:f400:7e1a::802;
 envelope-from=benoitdudu38@hotmail.fr;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 12 Oct 2022 16:08:44 -0400
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Oct 2022 18:32:33 -0000

--_000_PR3PR07MB676110594DCDCA29B33704ABE2229PR3PR07MB6761eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

A small fix for a compilation warning.


From ce76d128bf7a3101cb16d3397a396640c35e4a0d Mon Sep 17 00:00:00 2001
From: Benoit Dumas <benoitdudu38@hotmail.fr>
Date: Wed, 12 Oct 2022 20:05:09 +0200
Subject: [PATCH] Signed-off-by: Benoit Dumas <benoitdudu38@hotmail.fr>

fix a compilation warning treated as error by GCC9

Signed-off-by: Benoit Dumas <benoitdudu38@hotmail.fr>
---
 tests/qtest/vhost-user-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index 84498941a6..5a17ed5d03 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -493,7 +493,7 @@ static TestServer *test_server_new(const gchar *name,

     tmpfs =3D g_dir_make_tmp("vhost-test-XXXXXX", &err);
     if (!tmpfs) {
-        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
+        g_test_message("g_dir_make_tmp on path: %s",
                        err->message);
         g_error_free(err);
     }
--
2.17.1

--_000_PR3PR07MB676110594DCDCA29B33704ABE2229PR3PR07MB6761eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=3D"eleme=
ntToProof">
A small fix for a compilation warning.<br>
<br>
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=3D"eleme=
ntToProof ContentPasted0">
From ce76d128bf7a3101cb16d3397a396640c35e4a0d Mon Sep 17 00:00:00 2001
<div class=3D"ContentPasted0">From: Benoit Dumas &lt;benoitdudu38@hotmail.f=
r&gt;</div>
<div class=3D"ContentPasted0">Date: Wed, 12 Oct 2022 20:05:09 +0200</div>
<div class=3D"ContentPasted0">Subject: [PATCH] Signed-off-by: Benoit Dumas =
&lt;benoitdudu38@hotmail.fr&gt;</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">fix a compilation warning treated as error by=
 GCC9</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Signed-off-by: Benoit Dumas &lt;benoitdudu38@=
hotmail.fr&gt;</div>
<div class=3D"ContentPasted0">---</div>
<div class=3D"ContentPasted0">&nbsp;tests/qtest/vhost-user-test.c | 2 +-</d=
iv>
<div class=3D"ContentPasted0">&nbsp;1 file changed, 1 insertion(+), 1 delet=
ion(-)</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">diff --git a/tests/qtest/vhost-user-test.c b/=
tests/qtest/vhost-user-test.c</div>
<div class=3D"ContentPasted0">index 84498941a6..5a17ed5d03 100644</div>
<div class=3D"ContentPasted0">--- a/tests/qtest/vhost-user-test.c</div>
<div class=3D"ContentPasted0">+++ b/tests/qtest/vhost-user-test.c</div>
<div class=3D"ContentPasted0">@@ -493,7 +493,7 @@ static TestServer *test_s=
erver_new(const gchar *name,</div>
<div class=3D"ContentPasted0">&nbsp;</div>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp;tmpfs =3D g_dir_make_tmp(=
&quot;vhost-test-XXXXXX&quot;, &amp;err);</div>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp;if (!tmpfs) {</div>
<div class=3D"ContentPasted0">- &nbsp; &nbsp; &nbsp; &nbsp;g_test_message(&=
quot;g_dir_make_tmp on path (%s): %s&quot;, tmpfs,</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;g_test_message(&=
quot;g_dir_make_tmp on path: %s&quot;,</div>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; err-&gt;message);</div>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;g_error_fre=
e(err);</div>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">-- </div>
2.17.1<br>
</div>
</body>
</html>

--_000_PR3PR07MB676110594DCDCA29B33704ABE2229PR3PR07MB6761eurp_--

