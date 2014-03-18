Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPuL1-0000Uo-6z
	for mharc-qemu-trivial@gnu.org; Tue, 18 Mar 2014 09:45:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maxa@catit.be>) id 1WPn4R-0001vv-Oj
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 02:00:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maxa@catit.be>) id 1WPn4I-0000VN-To
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 02:00:15 -0400
Received: from mail-lb0-f182.google.com ([209.85.217.182]:62328)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maxa@catit.be>) id 1WPn4I-0000Rp-Nm
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 02:00:06 -0400
Received: by mail-lb0-f182.google.com with SMTP id n15so4491230lbi.27
	for <qemu-trivial@nongnu.org>; Mon, 17 Mar 2014 23:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Gn8Nppc29OWUGM++LlUNeCKXDPZcjqTo0w3SDwErBZA=;
	b=lrejshFsAOV+7cZA2NYIwFJDLKWKmZwVmuyByS0p2MTzF68OgnrO3tHGLQrftax5Ly
	wfno9Kasq5qyl/+UkBNmHryL0aVlywE7Zyw0WRD4ybo0d+0rhhQ+TFLzslqQNorOhM8a
	/8PFpek7T3viECkUKBPaVoWHBjqjps9POA3e6yk/+0MqijblZK9a73tu7ayUywLYPQ2P
	iwcppx/ppeHrxgyOkUxDoVJcqX6atAXpCVWZ+fumJE/TZQx1zuF1jyffu4ssFVBMG7kU
	FtxubnCOgEhnebVae37sizgP3ejcJ7YxQ0UgbnM0BowL9ElE4cfGdVt+trjPOvxHRKe2
	MDaQ==
X-Gm-Message-State: ALoCoQncyzuMNP62wV3srvZ/1Pueu2pKydi4kf0TCyXw13bDClEqGeXRUGVsV4plsbTQIXJPx7hj
X-Received: by 10.112.147.67 with SMTP id ti3mr18704138lbb.14.1395122405596;
	Mon, 17 Mar 2014 23:00:05 -0700 (PDT)
Received: from z1.base.vohkarts.com ([31.134.130.233])
	by mx.google.com with ESMTPSA id
	tq9sm14326202lbb.10.2014.03.17.23.00.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Mar 2014 23:00:04 -0700 (PDT)
From: Maria Kustova <maxa@catit.be>
To: qemu-devel@nongnu.org
Date: Tue, 18 Mar 2014 09:59:17 +0400
Message-Id: <1395122359-28890-2-git-send-email-maria.k@catit.be>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1395122359-28890-1-git-send-email-maria.k@catit.be>
References: <1395122359-28890-1-git-send-email-maria.k@catit.be>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.182
X-Mailman-Approved-At: Tue, 18 Mar 2014 09:45:48 -0400
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, Maria Kustova <maria.k@catit.be>,
	stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH v2 1/3] qemu-io-cmds: Fixed typo in example
	for writev.
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
X-List-Received-Date: Tue, 18 Mar 2014 06:00:22 -0000

Signed-off-by: Maria Kustova <maria.k@catit.be>
---
 qemu-io-cmds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index f1de24c..5707bda 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -1087,7 +1087,7 @@ writev_help(void)
 " writes a range of bytes from the given offset source from multiple buffers\n"
 "\n"
 " Example:\n"
-" 'write 512 1k 1k' - writes 2 kilobytes at 512 bytes into the open file\n"
+" 'writev 512 1k 1k' - writes 2 kilobytes at 512 bytes into the open file\n"
 "\n"
 " Writes into a segment of the currently open file, using a buffer\n"
 " filled with a set pattern (0xcdcdcdcd).\n"
-- 
1.8.2.1


