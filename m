Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QbRWr-0005g0-IE
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2011 02:12:09 -0400
Received: from eggs.gnu.org ([140.186.70.92]:38634)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agenthh@gmail.com>) id 1QbRWn-0005fo-UZ
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2011 02:12:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agenthh@gmail.com>) id 1QbRWm-0007Nf-Tb
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2011 02:12:05 -0400
Received: from mail-pz0-f45.google.com ([209.85.210.45]:43313)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agenthh@gmail.com>) id 1QbRWm-0007Nb-Mq
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2011 02:12:04 -0400
Received: by pzk30 with SMTP id 30so3693458pzk.4
	for <qemu-trivial@nongnu.org>; Mon, 27 Jun 2011 23:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=PrWUyLVMM3QHLdl4Bg6jh4W/UBp7UtsoPq9TAQ3+BaQ=;
	b=rO4ndigmQHEMVCW2USX2P1dLKODwTSys+2f/7evPippuLmqgEmfp1R++uRDQxtawNB
	WZOFaeBeiW31JvoZ81qB46hMZ7B4DuTTsYCcKnVpMI++RZCEDHYDQCIMZEuhk1IbS4Y9
	qEsEvZ8oAAHcYJzoQbAB4PjNET6g6fOn4JRAE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=rOkhpVMVQKy+8mXN5vqAyNceu5MRZE9bs5awP8rTFgZ0CzhZ9pX0t85XriAOh79ldu
	MJxGV3SLnvFt0y3KaUqTFRGEYkA0gjWdv1jlJlixBpORbENZ/VRQ8hFt9YkWAY6KCXJg
	mzt5kjp60go7fjc6fBjTQSPwro1cI2mkJ4vLw=
Received: by 10.142.88.12 with SMTP id l12mr869472wfb.447.1309241523051;
	Mon, 27 Jun 2011 23:12:03 -0700 (PDT)
Received: from [10.0.0.163] (wsip-72-214-251-130.sb.sd.cox.net
	[72.214.251.130])
	by mx.google.com with ESMTPS id e6sm4654874pbm.23.2011.06.27.23.12.01
	(version=SSLv3 cipher=OTHER); Mon, 27 Jun 2011 23:12:02 -0700 (PDT)
Message-ID: <4E0970AA.4060501@gmail.com>
Date: Mon, 27 Jun 2011 23:11:54 -0700
From: Hans N <agenthh@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: qemu-trivial@nongnu.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.45
Subject: [Qemu-trivial] [PATCH] Fix debug log option parsing in user-mode
	emulation
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
X-List-Received-Date: Tue, 28 Jun 2011 06:12:07 -0000

Fix cpu_str_to_log_mask() to actually use log_mask

Signed-off-by: Hans Nielsen <agenthh@gmail.com>
---
  bsd-user/main.c    |    2 +-
  darwin-user/main.c |    2 +-
  linux-user/main.c  |    2 +-
  3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 5f790b2..6018a41 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -866,7 +866,7 @@ int main(int argc, char **argv)
          int mask;
          const CPULogItem *item;

-        mask = cpu_str_to_log_mask(r);
+        mask = cpu_str_to_log_mask(log_mask);
          if (!mask) {
              printf("Log items (comma separated):\n");
              for (item = cpu_log_items; item->mask != 0; item++) {
diff --git a/darwin-user/main.c b/darwin-user/main.c
index a6dc859..35196a1 100644
--- a/darwin-user/main.c
+++ b/darwin-user/main.c
@@ -819,7 +819,7 @@ int main(int argc, char **argv)
          int mask;
          CPULogItem *item;

-        mask = cpu_str_to_log_mask(r);
+        mask = cpu_str_to_log_mask(log_mask);
          if (!mask) {
              printf("Log items (comma separated):\n");
              for (item = cpu_log_items; item->mask != 0; item++) {
diff --git a/linux-user/main.c b/linux-user/main.c
index db5577b..289054b 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -3030,7 +3030,7 @@ int main(int argc, char **argv, char **envp)
          int mask;
          const CPULogItem *item;

-        mask = cpu_str_to_log_mask(r);
+        mask = cpu_str_to_log_mask(log_mask);
          if (!mask) {
              printf("Log items (comma separated):\n");
              for (item = cpu_log_items; item->mask != 0; item++) {
--
1.7.5.4

