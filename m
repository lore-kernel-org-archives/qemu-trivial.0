Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daYlG-0005Jq-6T
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 22:42:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlD-0005Hi-EI
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:42:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYl7-0007ep-Sx
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:42:47 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:38191)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYl5-0007dE-NT; Wed, 26 Jul 2017 22:42:39 -0400
Received: by mail-qk0-x241.google.com with SMTP id v76so5569429qka.5;
	Wed, 26 Jul 2017 19:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/69DTTF8CHMzJBMNMPCpXYclsJdfH0mIALHeaJES2GA=;
	b=LeATPSb/+jKfvbT0XUknWT+SMSXql/40g24+SuI3XDbt0RnmLFJ+8baFYfjahUjiBd
	Zp8drfStagTCcC3gwNMiGQI9/TKevTVZWS9OAO9Dd2DpS4Qu4T4RVnub884ox8IP1hcx
	FvCG5pxJLfMYH+Vg/cXp+JoV2HU8EGbET67XP0weOA3R6Sasdl//kPLRguWmA1r9sBOu
	QOYE8fC37LxKIFK/Pw1eonSmSTyJKtvSSPGHtu4MzuVBGQ3Zk3alTpFF+7bSNxbDLOqk
	V6wsUUKfGNW3lHGrRJyn/AsfdLWMlFkK/+bSTxHHTr4NGG++BJNKOQUUhz78Zj6kDW2K
	/KiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=/69DTTF8CHMzJBMNMPCpXYclsJdfH0mIALHeaJES2GA=;
	b=eb1XiHtOIqGNebjWXMYaLWmwXY8ESMxfRDS2SyhKkUaDlz2NiSyRGiSwp3es8HRaE+
	Ag1Fz9xckxwz4CDnr6HBe0glHNd5eU93KUS/u4eWRRqONSIp8ONHVgLHGaR2kp2kvRe7
	fvikH23Y4sYl3AQaYPq1LjqhMX7u8BjDpYecnghovXQpuGXENDdX7JPzwJ+aCUSi2n2s
	/eiY3SHvarrFuQdXZ17a77YRDBmkjfGgT39mdrUV45DnwPAKcuzo8HLVY1fbpXfC4csC
	BdtAp82LZAdz7Dn5gbAVqwFaEV3gevvPsCyCqW0MeASKGiQgxocrCNrmB8zHUXMi5pyv
	6CNA==
X-Gm-Message-State: AIVw1134aNa6OlkbLUWTgFZROGRa6PBbJ72NjEiRApVoHB/ZbiAk9ZWL
	0cDDFqJhuY4LOA==
X-Received: by 10.55.167.211 with SMTP id q202mr3817538qke.77.1501123359143;
	Wed, 26 Jul 2017 19:42:39 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	g27sm13221147qtg.84.2017.07.26.19.42.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 19:42:37 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 26 Jul 2017 23:42:07 -0300
Message-Id: <20170727024224.22900-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170727024224.22900-1-f4bug@amsat.org>
References: <20170727024224.22900-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH for 2.10 v2 02/20] loader: check
 get_image_size() return value
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
X-List-Received-Date: Thu, 27 Jul 2017 02:42:49 -0000

since a negative value means it errored.

hw/core/loader.c:149:9: warning: Loss of sign in implicit conversion
    if (size > max_sz) {
        ^~~~
hw/core/loader.c:171:9: warning: Loss of sign in implicit conversion
    if (size > memory_region_size(mr)) {
        ^~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/core/loader.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index c17ace0a2e..4bb176f284 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -146,7 +146,7 @@ int load_image_targphys_as(const char *filename,
     int size;
 
     size = get_image_size(filename);
-    if (size > max_sz) {
+    if (size < 0 || size > max_sz) {
         return -1;
     }
     if (size > 0) {
@@ -168,7 +168,7 @@ int load_image_mr(const char *filename, MemoryRegion *mr)
 
     size = get_image_size(filename);
 
-    if (size > memory_region_size(mr)) {
+    if (size < 0 || size > memory_region_size(mr)) {
         return -1;
     }
     if (size > 0) {
-- 
2.13.3


