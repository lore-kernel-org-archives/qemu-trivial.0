Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dfiHB-00054G-BP
	for mharc-qemu-trivial@gnu.org; Thu, 10 Aug 2017 03:53:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57874)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chaojianhu@hotmail.com>) id 1dfiH9-000534-74
	for qemu-trivial@nongnu.org; Thu, 10 Aug 2017 03:53:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chaojianhu@hotmail.com>) id 1dfiH8-00041s-6P
	for qemu-trivial@nongnu.org; Thu, 10 Aug 2017 03:53:03 -0400
Received: from mail-co1nam05olkn0804.outbound.protection.outlook.com
	([2a01:111:f400:fe50::804]:45011
	helo=NAM05-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <chaojianhu@hotmail.com>)
	id 1dfiH5-0003xZ-FI; Thu, 10 Aug 2017 03:52:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=K6tvHzLW7fumnTa5OOisXuGsFMHfwI1ruJzXie0n1T4=;
	b=UFwOXh3GxxNH6S5NFVvm2gx1EmjsubzshBVjWl4vpIxL7d2rH2MiHwHZKvvPIaTF0F6C1kWc8xMoLv3fL2dw/ofqlOhtH8laO9vrZ4dOERLTJ/ZFzoP3O9L5YzOnJoJlqwhdeDIzvaS16NYB4Jf9ochRiHkqmt+03c+wK2HVnG7+8a2KDfRczoUxnXA/vwFFCmZ0vp6BcGCtFOskhFZ0iVyhW4AGLoXnmzSFXBIi55gF1H/PLKaISD1I411W/wc2NaGzvqXs36PRw2AVkN8Ag32rLy/wpdltEygycLAHtVfsOZKXYFh6lyMESUR3elP7qxajqDgxtTmAjvMi22z6Ag==
Received: from CO1NAM05FT036.eop-nam05.prod.protection.outlook.com
	(10.152.96.55) by CO1NAM05HT166.eop-nam05.prod.protection.outlook.com
	(10.152.97.112) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.1304.16;
	Thu, 10 Aug 2017 07:52:38 +0000
Received: from DM5PR17MB1451.namprd17.prod.outlook.com (10.152.96.55) by
	CO1NAM05FT036.mail.protection.outlook.com (10.152.96.149) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1304.16 via Frontend Transport; Thu, 10 Aug 2017 07:52:37 +0000
Received: from DM5PR17MB1451.namprd17.prod.outlook.com ([10.175.221.139]) by
	DM5PR17MB1451.namprd17.prod.outlook.com ([10.175.221.139]) with mapi id
	15.01.1304.027; Thu, 10 Aug 2017 07:52:37 +0000
From: Hu Chaojian <chaojianhu@hotmail.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, "ppandit@redhat.com"
	<ppandit@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"kwolf@redhat.com" <kwolf@redhat.com>, "stefanha@redhat.com"
	<stefanha@redhat.com>, Hu Chaojian <chaojianhu@hotmail.com>
Thread-Topic: [PATCH] block/qcow2-snapshot: Fix a null pointer dereference in
	qcow2_free_snapshots
Thread-Index: AQHTEa2iaWdYqPpFAEa0RT5UUbUZHA==
Date: Thu, 10 Aug 2017 07:52:37 +0000
Message-ID: <DM5PR17MB1451D437FA7145AEBE4688CFDB880@DM5PR17MB1451.namprd17.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:E5E6494E407611332E746871EF9183C82BE0E89383199A476B5108E4EBEF1630;
	UpperCasedChecksum:8F9BA6DDECD2ED51A4876FACFBA26AF680756474F0CEA3FAB4368604C3847D4F;
	SizeAsReceived:7383; Count:44
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [XWlQAJFRQm4RsfbFMtU28ezV4OL8DYDK]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CO1NAM05HT166;
	7:3Ph9efe8xuTZQ64kKhjtSqcXYjLDDbGQpXcReXTgm8Iq0WL84fFaH5ImsQxK7FTANt8ZT/c5U8VjzVvl0z3J3wYb/Av70GswzzciqtiklnaaO1uA/PgK7Y+VggOi/+HsvuNUnOx05WYqsO05+L0ETgxOdOR/FFxYr87nOp+Lj2T8+s7AeLh1Fs6hLCCZOSLB/lwnmjYV4Ya/D9cO89maKrE5aLazPKRYsscZow3BwjTmHkFtCXdxfEVws1JKzsbwFvQRBn49H3csCWs3JvzZyLnsk7jej3Z0ZcbQqdpWv43SU0xe+u49oh6JAe0qedpgePM9oEB6bXT3TVBq4vA/uibr1AW+MRhvSuJJPNIAjwbIYvoAlQLYnl7hqPk2jYY4PI8VPD3Nduxl05MGLNijHTUZp89ahFp785cfVJnXv19bqpvGsuXmeDFzWOtfo16QCBM6baSYh6vQDwz6x9yWS+vtW7rV+a9WIn1aAGqBNl1YvhrD72ygm/9JAIeORoJDOxKwn9vUjyedsuW4nFaiRleWlN2m7s8LOBFGcouqjHMgqRlesxhSrqHfuwOC6ZiCINZI23YFD7lMBWjdM7T8plk+gxJjXqDgXMNALiSVH1fBh4B6s9fNKsNPiLJlvQFtiUWIyF1L5BoN6e1417ov+H1VQ72KBKlAdhCjGIygJWJat1UvfQmV96gTdd2jpEkkiQzZZDEYwRxQDezyhjW6oUzo+9C3llcWEHP73tW61pORGlToAD1xpxkPThsfdLo13uT4EqB8zy9DLil3OPYsAw==
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-forefront-antispam-report: EFV:NLI; SFV:NSPM; SFS:(7070007)(98901004);
	DIR:OUT; SFP:1901; SCL:1; SRVR:CO1NAM05HT166;
	H:DM5PR17MB1451.namprd17.prod.outlook.com; FPR:; SPF:None; LANG:;
x-ms-office365-filtering-correlation-id: 87fdb116-960c-41e2-3fdb-08d4dfc4c44b
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201702061074)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031324274)(2017031323274)(201702181274)(2017031322377)(1601125374)(1603101448)(1701031045)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CO1NAM05HT166; 
x-ms-exchange-slblob-mailprops: Zv/SX2iM+5XB1LoHjPpcVYGnEfjZhsy3dW0NfOeEpnWvdVMgC3NoaFCCy3muwebptYRaH50MdYPXYA5/lW4wu2DKN4zcnlYhSug40wnuHbiazLApWtoxilgxtA97pXq3t5da8k62bUSwxbFmarO7YI/NXt7EP3jnZJFHnKSeETQcpjdvEqQ7+QdHAM/oHCu/Nfrr29U3wI5bqjqtHymsptMvocUcmFVnlULkDgJO3aPh3A7/zYX/uED58fS5TCpQGn38x9ffOP3ylV/4L1G/zy0uhnymig40lctrtQV0cSIPJu8LZu7Xcr/uAbUaW2kfzL79lJZP8Y7vD1rRlB8dNMoTHWqBFB/BZpw2KI0zOJP137pZsJ/pIgB28xR4wxUHcDahIxGZ7DSjKuGIu/eY6Z9lH9eekJ8tidkryx6+Zy20G1Sbj+uKO5xOnOPy9bu4UKdrhpnBkVgr6UOQSWqRCUHQXZ6/8t2XTunGWf6vr42fZ1fJVqIlkTg1pHQ+iuZs7kcXCphzOn1d5sBffP6xSJrO3A8OA+HXAdV/8nmJpThcUyKgMfKjOkwAlj16MaFRB+CrV97dw3x3EpUWNWDnQ476xwUhSVE6qiLWpPuk/JcNNIWDEe6V5Mfz+jQjJ/JrtY6Dqzll/7Un4N+Bsf5Fe7nsZ63YLUxgtcarW/4QSGY5Zf1/teeRxb17JlHkyncLaY+Ctcj/Xy4=
x-ms-traffictypediagnostic: CO1NAM05HT166:
authentication-results: outbound.protection.outlook.com; spf=skipped
	(originating message); dkim=none (message not signed) header.d=none;
	dmarc=none action=none header.from=hotmail.com;
x-exchange-antispam-report-test: UriScan:(130873036417446)(194151415913766);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(444000031);
	SRVR:CO1NAM05HT166; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CO1NAM05HT166; 
x-forefront-prvs: 03950F25EC
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2017 07:52:37.6088 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM05HT166
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe50::804
Subject: [Qemu-trivial] [PATCH] block/qcow2-snapshot: Fix a null pointer
 dereference in qcow2_free_snapshots
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Aug 2017 07:53:04 -0000

From: chaojianhu <chaojianhu@hotmail.com>

In function qcow2_do_open, if "go fail;" before calling qcow2_read_snapshot=
s, then snapshots=20
will always be NULL. When dealing with "fail:", qcow2_free_snapshots will b=
e called, and=20
s->snapshots will be dereferenced without checked.

Reported-by: chaojianhu <chaojianhu@hotmail.com>
Signed-off-by: chaojianhu <chaojianhu@hotmail.com>

---
 block/qcow2-snapshot.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/block/qcow2-snapshot.c b/block/qcow2-snapshot.c
index 44243e0..4a8128c 100644
--- a/block/qcow2-snapshot.c
+++ b/block/qcow2-snapshot.c
@@ -35,6 +35,10 @@ void qcow2_free_snapshots(BlockDriverState *bs)
     BDRVQcow2State *s =3D bs->opaque;
     int i;
=20
+    if (NULL =3D=3D s->snapshots) {
+        return;
+    }
+
     for(i =3D 0; i < s->nb_snapshots; i++) {
         g_free(s->snapshots[i].name);
         g_free(s->snapshots[i].id_str);
--=20
1.9.1


