Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eLKm7-0006qp-63
	for mharc-qemu-trivial@gnu.org; Sat, 02 Dec 2017 22:17:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shravan2x@utexas.edu>) id 1eLGLn-0002X7-MR
	for qemu-trivial@nongnu.org; Sat, 02 Dec 2017 17:33:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shravan2x@utexas.edu>) id 1eLGLk-0007eN-Jw
	for qemu-trivial@nongnu.org; Sat, 02 Dec 2017 17:33:35 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:39072)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shravan2x@utexas.edu>)
	id 1eLGLk-0007dJ-Al
	for qemu-trivial@nongnu.org; Sat, 02 Dec 2017 17:33:32 -0500
Received: by mail-ot0-x242.google.com with SMTP id v21so11912974oth.6
	for <qemu-trivial@nongnu.org>; Sat, 02 Dec 2017 14:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=utexas-edu.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=YAz5vapA0rJqPoZ9GrCBO9Ehw2iYfrqzLf2Qc3FhDCw=;
	b=gCqg5/HJaqW2hETotJ9o4UKLobqSu2NCTLOavvN09yWqvmpNiIK6z3j4vGdQ3/aikh
	OCWQwjOUZJwQboMwo6fD/txVjdkUx5Ejqub0whCSTjmm7/jbgnkefkS6gb5mYQOgACMo
	KtsO35gf6KbG7WsdbEQHFOkoNwSraFkYUV9RVjBg8qYl4pwd2cTCokfGB5Mo9wE/xIwt
	0HkqZu3HVZ+LUkwdanGaekP3ltFOP/TFuSs0bXuj4GyURi+ltu9xIA5V08/mhxjT7AlY
	VRtZd+TASLTTttw8BI6qBY0ov//lfDfGlyXblM/0v0EPDAZ1L3lTgeSJCmf0rsOZfgvV
	QshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YAz5vapA0rJqPoZ9GrCBO9Ehw2iYfrqzLf2Qc3FhDCw=;
	b=jUIbz6NM37WYNd4WRvlLaQAj/57W5ginBKaJyUSLFkzWkG9Unnb0AAFPxV8pMpmeZY
	voPq2O9Dq4gAz/6G/mpaPv+cz+fomBfc+RjAanFkW256C53YV8xycxy9qHZc1i91nlOS
	R1mj+bQ9F2vSh0qFath/K5CguxixyNr+AlLc3xMOwfMA1xSx/iUuPUVQtyHbrHHnAl+U
	A9uXTd4aUCvPBW1xp+8FZXk/jLcowkMBKzH64xUt8Lty7Wnn3guEs1nJruFQIaEip4hF
	yv8ahZwhBqg7TwZ8NnPgdaVogoDPB8NLh5gqtLE/pOnUxb0r/7a37hsh0AXYpoFsDv5d
	tkMQ==
X-Gm-Message-State: AJaThX7Sc4KK4pd8eiplD9lSn2Jbpfnd+e0N+gh17SzYMDShZ+ZJIBvB
	0kP6BgKICDRFJiFm3DD8EzY7dA==
X-Google-Smtp-Source: AGs4zMYX3sk/QqKB8Z0sekwW0ZQHvYiWE3/+nr/WlUmRqexiex+sL82Sa9AXDgITyGJK1HkFRYZIPw==
X-Received: by 10.157.89.165 with SMTP id u37mr13017177oth.186.1512254008690; 
	Sat, 02 Dec 2017 14:33:28 -0800 (PST)
Received: from ubuntu.localdomain (cpe-72-182-52-135.austin.res.rr.com.
	[72.182.52.135]) by smtp.gmail.com with ESMTPSA id
	r129sm4156344oig.14.2017.12.02.14.33.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 02 Dec 2017 14:33:28 -0800 (PST)
From: Shravan Rajinikanth <shravan2x@utexas.edu>
To: star.shravan@gmail.com
Cc: Shravan Rajinikanth <shravan2x@utexas.edu>,
	qemu-trivial@nongnu.org
Date: Sat,  2 Dec 2017 14:33:03 -0800
Message-Id: <1512253983-7453-1-git-send-email-shravan2x@utexas.edu>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
X-Mailman-Approved-At: Sat, 02 Dec 2017 22:17:02 -0500
Subject: [Qemu-trivial] [PATCH] qemu-img: Fixed grammatical error in
 dump_human_image_check
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
X-List-Received-Date: Sat, 02 Dec 2017 22:33:36 -0000

Signed-off-by: Shravan Rajinikanth <shravan2x@utexas.edu>
---
 qemu-img.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-img.c b/qemu-img.c
index 68b375f..bea9268 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -580,7 +580,7 @@ static void dump_human_image_check(ImageCheck *check, bool quiet)
         if (check->leaks) {
             qprintf(quiet,
                     "\n%" PRId64 " leaked clusters were found on the image.\n"
-                    "This means waste of disk space, but no harm to data.\n",
+                    "This means disk space is wasted, but data is safe.\n",
                     check->leaks);
         }
 
-- 
2.7.4


