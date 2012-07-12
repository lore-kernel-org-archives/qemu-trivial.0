Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SpA4q-0001yH-Ru
	for mharc-qemu-trivial@gnu.org; Wed, 11 Jul 2012 23:28:28 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42438)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <donald.open@gmail.com>) id 1SpA4o-0001xJ-Bs
	for qemu-trivial@nongnu.org; Wed, 11 Jul 2012 23:28:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <donald.open@gmail.com>) id 1SpA4m-0000CB-Kz
	for qemu-trivial@nongnu.org; Wed, 11 Jul 2012 23:28:26 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:46942)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <donald.open@gmail.com>)
	id 1SpA4m-00009J-F5; Wed, 11 Jul 2012 23:28:24 -0400
Received: by pbbro12 with SMTP id ro12so3182738pbb.4
	for <multiple recipients>; Wed, 11 Jul 2012 20:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=bAAr8EFC6ma1bV2NYYDNklUn0EXVEGu6a1ecib3stVk=;
	b=bPJbNxp5mLzC1KIaKMxIrHSMNxsK9kHVqUltq3Kh/PJFKgVlL+uB7cXNfjoeFmaDPG
	NCXKVr99BwE74C9cLNau/DsmGXLKEpLLbHjUHSPWilwWD+5FvLt/acDrevoZvbNvysNW
	48a3bpDZGGqudb6a7tHvrqfNDbhYezXH8Ns82mrpRHS+Ooq6ckEpJoush+FcN2gN7iZL
	N+1HPQ3WZrEPFpqk5/t+DPffuiYJOH8ynlFbnqsXn+ejEFkdU85QjWSiRsfa5Uf+FtM4
	70DM9xUHWaOOGTM3Luek8iNqn3mdSsY5PH1mQcoaD/hkBQvh5mLdqyx/pWn1fV2tNlWM
	d7qw==
Received: by 10.68.236.168 with SMTP id uv8mr1725407pbc.25.1342063703444;
	Wed, 11 Jul 2012 20:28:23 -0700 (PDT)
Received: from localhost.localdomain ([202.108.130.138])
	by mx.google.com with ESMTPS id pz9sm2926901pbb.61.2012.07.11.20.28.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Jul 2012 20:28:22 -0700 (PDT)
Sender: Dong Xu Wang <donald.open@gmail.com>
From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Thu, 12 Jul 2012 11:28:01 +0800
Message-Id: <1342063681-957-1-git-send-email-wdongxu@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-devel@nongnu.org, riegamaths@gmail.com, stefanha@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH v2] qemu-img: correct help message
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
X-List-Received-Date: Thu, 12 Jul 2012 03:28:27 -0000

qemu-img not only suports k/K/M/G/T/b, but also supports m/g/t/B. So correct
it in help message.

Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
CC: riegamaths@gmail.com
---
v1->v2: also correct error reporting.

 qemu-img.c |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index 80cfb9b..7f2fde4 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -69,8 +69,9 @@ static void help(void)
            "    options are: 'none', 'writeback' (default, except for convert), 'writethrough',\n"
            "    'directsync' and 'unsafe' (default for convert)\n"
            "  'size' is the disk image size in bytes. Optional suffixes\n"
-           "    'k' or 'K' (kilobyte, 1024), 'M' (megabyte, 1024k), 'G' (gigabyte, 1024M)\n"
-           "    and T (terabyte, 1024G) are supported. 'b' is ignored.\n"
+           "    'k' or 'K' (kilobyte, 1024), 'm' or 'M' (megabyte, 1024k),\n"
+           "    'g' or 'G' (gigabyte, 1024M) and 't' or 'T' (terabyte, 1024G) are supported.\n"
+           "    'b' or 'B' is ignored.\n"
            "  'output_filename' is the destination disk image filename\n"
            "  'output_fmt' is the destination format\n"
            "  'options' is a comma separated list of format specific options in a\n"
@@ -341,8 +342,8 @@ static int img_create(int argc, char **argv)
         char *end;
         sval = strtosz_suffix(argv[optind++], &end, STRTOSZ_DEFSUFFIX_B);
         if (sval < 0 || *end) {
-            error_report("Invalid image size specified! You may use k, M, G or "
-                  "T suffixes for ");
+            error_report("Invalid image size specified! You may use k/K, m/M, "
+                  "g/G or t/T suffixes for ");
             error_report("kilobytes, megabytes, gigabytes and terabytes.");
             ret = -1;
             goto out;
-- 
1.7.1


