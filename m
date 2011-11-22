Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RSnHQ-00084U-A7
	for mharc-qemu-trivial@gnu.org; Tue, 22 Nov 2011 05:08:44 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnHD-0007TB-LU
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:08:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnGi-00067j-Dz
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:08:09 -0500
Received: from e28smtp01.in.ibm.com ([122.248.162.1]:48748)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnGg-00062U-J5
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:08:00 -0500
Received: from /spool/local
	by e28smtp01.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <wdongxu@linux.vnet.ibm.com>;
	Tue, 22 Nov 2011 15:37:34 +0530
Received: from d28relay01.in.ibm.com ([9.184.220.58])
	by e28smtp01.in.ibm.com ([192.168.1.131]) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 22 Nov 2011 15:37:17 +0530
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay01.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	pAMA7Fnu4186180; Tue, 22 Nov 2011 15:37:16 +0530
Received: from d28av05.in.ibm.com (loopback [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	pAMA7Ft4027690; Tue, 22 Nov 2011 21:07:15 +1100
Received: from wdongxu-T410.cn.ibm.com (wdongxu-t410.cn.ibm.com
	[9.115.118.147] (may be forged))
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	pAMA6u0L026400; Tue, 22 Nov 2011 21:07:14 +1100
From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Nov 2011 18:06:18 +0800
Message-Id: <1321956386-12004-3-git-send-email-wdongxu@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
References: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
x-cbid: 11112210-4790-0000-0000-00000016BDB4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 122.248.162.1
Cc: qemu-trivial@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH 03/11] fix spelling in libcacard sub directory
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Nov 2011 10:08:43 -0000

From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>


Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
---
 libcacard/card_7816.c      |    4 ++--
 libcacard/card_7816.h      |    2 +-
 libcacard/vcard_emul_nss.c |    2 +-
 libcacard/vscard_common.h  |    2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/libcacard/card_7816.c b/libcacard/card_7816.c
index 6fe27d5..8d06326 100644
--- a/libcacard/card_7816.c
+++ b/libcacard/card_7816.c
@@ -125,7 +125,7 @@ vcard_response_new_bytes(VCard *card, unsigned char *buf, int len, int Le,
 }
 
 /*
- * get a new Reponse buffer that only has a status.
+ * get a new Response buffer that only has a status.
  */
 static VCardResponse *
 vcard_response_new_status(vcard_7816_status_t status)
@@ -239,7 +239,7 @@ vcard_apdu_set_class(VCardAPDU *apdu) {
 }
 
 /*
- * set the Le and Lc fiels according to table 5 of the
+ * set the Le and Lc fields according to table 5 of the
  * 7816-4 part 4 spec
  */
 static vcard_7816_status_t
diff --git a/libcacard/card_7816.h b/libcacard/card_7816.h
index 2bb2a0d..4a01993 100644
--- a/libcacard/card_7816.h
+++ b/libcacard/card_7816.h
@@ -23,7 +23,7 @@ VCardResponse *vcard_response_new_bytes(VCard *card, unsigned char *buf,
 /* response from just status bytes */
 VCardResponse *vcard_response_new_status_bytes(unsigned char sw1,
                                                unsigned char sw2);
-/* response from just status: NOTE this cannot fail, it will alwyas return a
+/* response from just status: NOTE this cannot fail, it will always return a
  * valid response, if it can't allocate memory, the response will be
  * VCARD7816_STATUS_EXC_ERROR_MEMORY_FAILURE */
 VCardResponse *vcard_make_response(vcard_7816_status_t status);
diff --git a/libcacard/vcard_emul_nss.c b/libcacard/vcard_emul_nss.c
index 397485c..bdc3c79 100644
--- a/libcacard/vcard_emul_nss.c
+++ b/libcacard/vcard_emul_nss.c
@@ -1250,7 +1250,7 @@ vcard_emul_usage(void)
 "  {card_type_to_emulate}  What card interface to present to the guest\n"
 "  {param_for_card}        Card interface specific parameters\n"
 "  {slot_name}             NSS slot that contains the certs\n"
-"  {vreader_name}          Virutal reader name to present to the guest\n"
+"  {vreader_name}          Virtual reader name to present to the guest\n"
 "  {certN}                 Nickname of the certificate n on the virtual card\n"
 "\n"
 "These parameters come as a single string separated by blanks or newlines."
diff --git a/libcacard/vscard_common.h b/libcacard/vscard_common.h
index 609ae98..08f68e4 100644
--- a/libcacard/vscard_common.h
+++ b/libcacard/vscard_common.h
@@ -44,7 +44,7 @@
  * to the existing messages, addition of fields.
  *
  * The major digit is for a breaking change of protocol, presumably
- * something that cannot be accomodated with the existing protocol.
+ * something that cannot be accommodated with the existing protocol.
  */
 
 #define VSCARD_VERSION MAKE_VERSION(0, 0, 2)
-- 
1.7.5.4


