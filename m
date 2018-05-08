Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fG4Z0-0003m9-W5
	for mharc-qemu-trivial@gnu.org; Tue, 08 May 2018 11:30:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1fG4Yy-0003jt-Oy
	for qemu-trivial@nongnu.org; Tue, 08 May 2018 11:30:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1fG4Yv-0002U1-Ib
	for qemu-trivial@nongnu.org; Tue, 08 May 2018 11:30:00 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60156)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanb@linux.vnet.ibm.com>)
	id 1fG4Yv-0002TW-B2
	for qemu-trivial@nongnu.org; Tue, 08 May 2018 11:29:57 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w48FTk0B127072
	for <qemu-trivial@nongnu.org>; Tue, 8 May 2018 11:29:56 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2hubhs20ab-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Tue, 08 May 2018 11:29:56 -0400
Received: from localhost
	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Tue, 8 May 2018 11:29:54 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
	by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 8 May 2018 11:29:52 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
	[9.57.199.111])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	w48FTqco3277092; Tue, 8 May 2018 15:29:52 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73E55AC040;
	Tue,  8 May 2018 11:31:23 -0400 (EDT)
Received: from sbct-3.watson.ibm.com (unknown [9.47.158.153])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 5D53CAC03A;
	Tue,  8 May 2018 11:31:23 -0400 (EDT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, berrange@redhat.com,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>
Date: Tue,  8 May 2018 11:29:35 -0400
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
x-cbid: 18050815-0040-0000-0000-000004285E9D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008993; HX=3.00000241; KW=3.00000007;
	PH=3.00000004; SC=3.00000259; SDB=6.01029344; UDB=6.00525967;
	IPR=6.00808477; 
	MB=3.00020995; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-08 15:29:54
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050815-0041-0000-0000-0000082E6BC7
Message-Id: <1525793375-15367-1-git-send-email-stefanb@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-05-08_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
	definitions=main-1805080148
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id w48FTk0B127072
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: [Qemu-trivial] [PATCH] tests: fix tpm-crb tpm-tis tests race
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
X-List-Received-Date: Tue, 08 May 2018 15:30:01 -0000

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

No need to close the TPM data socket on the emulator end, qemu will
close it after a SHUTDOWN. This avoids a race between close() and
read() in the TPM data thread.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
---
 tests/tpm-emu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tpm-emu.c b/tests/tpm-emu.c
index 4dada76..8c2bd53 100644
--- a/tests/tpm-emu.c
+++ b/tests/tpm-emu.c
@@ -125,7 +125,7 @@ void *tpm_emu_ctrl_thread(void *data)
         case CMD_SHUTDOWN: {
             ptm_res res =3D 0;
             qio_channel_write(ioc, (char *)&res, sizeof(res), &error_abo=
rt);
-            qio_channel_close(s->tpm_ioc, &error_abort);
+            /* the tpm data thread is expected to finish now */
             g_thread_join(s->emu_tpm_thread);
             break;
         }
--=20
2.5.5


