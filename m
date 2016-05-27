Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b6BIM-0007HT-Fc
	for mharc-qemu-trivial@gnu.org; Fri, 27 May 2016 02:30:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <steven@steven676.net>) id 1b69m0-0002qF-Rw
	for qemu-trivial@nongnu.org; Fri, 27 May 2016 00:53:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <steven@steven676.net>) id 1b69lu-00006J-0i
	for qemu-trivial@nongnu.org; Fri, 27 May 2016 00:53:23 -0400
Received: from nm18-vm0.bullet.mail.ne1.yahoo.com ([98.138.91.37]:54604)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <steven@steven676.net>) id 1b69lt-00005v-QX
	for qemu-trivial@nongnu.org; Fri, 27 May 2016 00:53:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1464324795; bh=ExOY9Sfyu6iBoo8fwUaTbEcsyJMEX/aVokCDxK4/yxM=;
	h=From:To:Cc:Subject:Date:From:Subject;
	b=YoLAVTqSYS+kXoWkToESjLA+bJ880hfoCuvBLQh/BrDSfADxDgeuIaSSyOJUtoQ6toXzwfpW2G+HP5a4j+iuh9dNncEHsN/6YRtP/81IRZH6J89X02R+E5NepMK+18N9cMKhCQEIfsiWItppOE05Fznw7GrNb6t3oPxuRw9x+EP4pTep4ljBLwZpl7gIrc9rcGpl9WP6s5jBkGv8b6q7+q690Kam0ZODHl8QVTHVJEh/EMSHoDVL39g4J0zcBi4ff2dWKOaVcUlv/98YDL8h5EV6jLm7x2BtdHULVt4jaqI1+F0jd/rDWUU/ynPBrCirKjnjC0bbqbnag8JXI1VWGA==
Received: from [98.138.100.112] by nm18.bullet.mail.ne1.yahoo.com with NNFMP;
	27 May 2016 04:53:15 -0000
Received: from [98.138.226.59] by tm103.bullet.mail.ne1.yahoo.com with NNFMP;
	27 May 2016 04:53:15 -0000
Received: from [127.0.0.1] by smtp210.mail.ne1.yahoo.com with NNFMP;
	27 May 2016 04:50:53 -0000
X-Yahoo-Newman-Id: 979191.810.bm@smtp210.mail.ne1.yahoo.com
X-Yahoo-Newman-Property: ymail-3
X-YMail-OSG: Mq9jPWwVM1nWDMKWX155Rj0ussdvoQyZoREwNVT51NrU371
	jw9GOcMvI6CJGts_Uh3lUAObLyY75p_qHRMkpBY5kGdlUaMZwdzpWLsLVwCP
	Y7I76VtCUMS8iIdL53nKPz3mLbCwC6kUqJ2JqBAsrsagET1Rq8qa0wutlIJT
	wIgu2CdjgfljvGXS.6L15eJw0jW_pSmi2ONhMb7T9SxbeXBKBErNBj5qWxdJ
	QYJqOEpEFHaARFJEZplzya9RrowFbl.jzGlHorP97i5b5o0vY9MxFerPBfAA
	pramEcjTguFMB2BQMIRXEeS9rN3d8P1tvXs0BBUgdZ0.tOmXBPcFPoCUilmt
	Q6DTQerfYm.yP2m3bZx_tcRK_LIGhyoHPDI.OFr1WWHIfviFL5Dfrov.F6r4
	hZJK39Wl2SfHLl_zOU8tzWYil668ux9U00TRZ2hUH5TdBKD2PaBtZvNUezoE
	.6oFvJES1HXT8pG3gC7UQ6S776eUyFkcs4QpWRzvCDFJ6hXkQIkkpn2KoXpA
	.EXjKjn.1IpR_LqIcZvifv7S7jiTYSTYaY84PRIueWw9Thz7.gX5DKg--
X-Yahoo-SMTP: Y7o5YpyswBBHhc3nmZojVAb_njS6isj_ExStQZr.uIjYoAwP
Received: from sandcity.steven676.net (fortord.int.steven676.net [192.168.0.1])
	by carmel.steven676.net (Postfix) with ESMTPS id E90A513A46;
	Thu, 26 May 2016 21:53:13 -0700 (PDT)
Received: by sandcity.steven676.net (Postfix, from userid 1000)
	id 8EB4D20B08; Thu, 26 May 2016 21:53:13 -0700 (PDT)
From: Steven Luo <steven@steven676.net>
To: qemu-devel@nongnu.org
Cc: "Daniel P. Berrange" <berrange@redhat.com>, qemu-trivial@nongnu.org,
	qemu-stable@nongnu.org
Date: Thu, 26 May 2016 21:53:13 -0700
Message-Id: <1464324793-29101-1-git-send-email-steven@steven676.net>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 98.138.91.37
X-Mailman-Approved-At: Fri, 27 May 2016 02:30:53 -0400
Subject: [Qemu-trivial] [PATCH] Fix configure test for PBKDF2 in nettle
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
X-List-Received-Date: Fri, 27 May 2016 04:53:25 -0000

From: Steven Luo <steven+qemu@steven676.net>

On my Debian jessie system, including nettle/pbkdf2.h does not cause
NULL to be defined, which causes the test to fail to compile.  Include
stddef.h to bring in a definition of NULL.

Cc: qemu-trivial@nongnu.org
Cc: qemu-stable@nongnu.org
Signed-off-by: Steven Luo <steven+qemu@steven676.net>
---
I suppose this could also be fixed by defining NULL ourselves, or by
replacing NULLs with 0s -- if one of those other approaches is
preferred, let me know.

 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index c37fc5f..0aae017 100755
--- a/configure
+++ b/configure
@@ -2342,6 +2342,7 @@ if test "$nettle" != "no"; then
         nettle="yes"
 
         cat > $TMPC << EOF
+#include <stddef.h>
 #include <nettle/pbkdf2.h>
 int main(void) {
      pbkdf2_hmac_sha256(8, NULL, 1000, 8, NULL, 8, NULL);
-- 
2.1.4


