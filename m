Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TU2Rt-0005wu-A4
	for mharc-qemu-trivial@gnu.org; Thu, 01 Nov 2012 17:37:13 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1TU2Rq-0005nW-BP
	for qemu-trivial@nongnu.org; Thu, 01 Nov 2012 17:37:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1TU2Rp-00028q-B9
	for qemu-trivial@nongnu.org; Thu, 01 Nov 2012 17:37:10 -0400
Received: from mail-pa0-f45.google.com ([209.85.220.45]:50539)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1TU2Rm-000288-Kw; Thu, 01 Nov 2012 17:37:06 -0400
Received: by mail-pa0-f45.google.com with SMTP id fb10so1941203pad.4
	for <multiple recipients>; Thu, 01 Nov 2012 14:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=LSyFn/HiFEYKX+C9cDWpDAHOZAzTbS8bfCycFYSpEY4=;
	b=oNB+NrhCa5PHGzE2rMUSiPD7/nn7P5GMAa4ftGR+zRRaVdHXyfCCG0JxQ5pUpavr8Q
	aJXiQX0bOWXZ4uTdPoY5oaOCkAa3KPFnOaYFB56Eco8dEGoG1sb6zKzXj7y0+OttFylC
	gh6fdKyynBWeORzI7/zYFpzNrqpUqZHlHNsDZ+JGjCcPn7ZnlMQEae6wdOxpZ/1P4V6s
	6H9/coMXdzxBVHX/ALa00c+JRIHGehCw5X6zmEmA4aYT5iEkAnbzjwnHUys3bChf9E/O
	e7nNwVgLg5KQabUc7OYMOu1Fjcc9i3kGfR5z3Em0uOyC7ks0eZKGU3rsXyn6ZXQKIDmR
	IqWg==
Received: by 10.66.73.34 with SMTP id i2mr5176404pav.28.1351805825761;
	Thu, 01 Nov 2012 14:37:05 -0700 (PDT)
Received: from pebble.twiddle.home.com ([1.152.139.87])
	by mx.google.com with ESMTPS id c7sm4534436pay.10.2012.11.01.14.37.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 14:37:05 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Fri,  2 Nov 2012 08:36:36 +1100
Message-Id: <1351805797-31899-3-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1351805797-31899-1-git-send-email-rth@twiddle.net>
References: <1351805797-31899-1-git-send-email-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.220.45
Cc: qemu-trivial@nongnu.org, Paul Brook <paul@codesourcery.com>
Subject: [Qemu-trivial] [PATCH 2/3] target-m68k: Remove t1 from CPUM68KState
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
X-List-Received-Date: Thu, 01 Nov 2012 21:37:11 -0000

This field is no longer used.

Cc: Paul Brook <paul@codesourcery.com>
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 target-m68k/cpu.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target-m68k/cpu.h b/target-m68k/cpu.h
index 780e2c9..f4fcdee 100644
--- a/target-m68k/cpu.h
+++ b/target-m68k/cpu.h
@@ -103,9 +103,6 @@ typedef struct CPUM68KState {
     uint32_t rambar0;
     uint32_t cacr;
 
-    /* ??? remove this.  */
-    uint32_t t1;
-
     int pending_vector;
     int pending_level;
 
-- 
1.7.11.7


