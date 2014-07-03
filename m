Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X2jOi-000085-Uk
	for mharc-qemu-trivial@gnu.org; Thu, 03 Jul 2014 11:58:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44439)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1X2jOX-0008OS-Rr
	for qemu-trivial@nongnu.org; Thu, 03 Jul 2014 11:58:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1X2jOO-0005aR-Oy
	for qemu-trivial@nongnu.org; Thu, 03 Jul 2014 11:57:57 -0400
Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c]:63202)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1X2jO6-0005Ob-Fh; Thu, 03 Jul 2014 11:57:30 -0400
Received: by mail-pd0-f172.google.com with SMTP id w10so435331pde.3
	for <multiple recipients>; Thu, 03 Jul 2014 08:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	bh=/3NpSH5sdXx3n8RWS6uPbL5n/RyFbfpU3E04SJK0XPE=;
	b=zqqMGsc7C3bXkft/US9Z7sQUZolR8MhdEGAoukaMYgoej4M6VW01uY4pIEa6KlPqQn
	TXyRaMQXC0DQY7Byn7ombc11bbrYMNAoWtTXpbutz/1meu+deejW8omj4GIOMzwlVSYm
	KIDArACKgl+54x97za55NoIgzx8vDvDyV+o6z6XR0jXKYQoUYs9FGsSlwTrTIVU5TFxe
	fZ5gc+LjjfLszNpcCiEFE+bq0/FtsnfHmFXYSLkVEyztFd/fOxfojYwGs7FSJ30GaWGO
	Kg/429xD8HUF8ZanDtyAsVTeIcdPAqBLmdlM6DnVhovz9HHPj7G/IpWJJYZzafyVBoTi
	XLBQ==
X-Received: by 10.70.34.39 with SMTP id w7mr4955682pdi.19.1404403048484;
	Thu, 03 Jul 2014 08:57:28 -0700 (PDT)
Received: from [192.168.1.104] ([223.72.65.68])
	by mx.google.com with ESMTPSA id
	oa17sm5306080pdb.46.2014.07.03.08.57.26 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 03 Jul 2014 08:57:27 -0700 (PDT)
Message-ID: <53B57D5B.2070204@gmail.com>
Date: Thu, 03 Jul 2014 23:57:15 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22c
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH trivial] qemu-img: Remove redundancy "ret =
	-1"
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
X-List-Received-Date: Thu, 03 Jul 2014 15:58:07 -0000

In this case, 'ret' is already '-1', so need not do it again.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 qemu-img.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/qemu-img.c b/qemu-img.c
index c98896b..d4518e7 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -246,7 +246,6 @@ static int read_password(char *buf, int buf_size)
             if (errno == EAGAIN || errno == EINTR) {
                 continue;
             } else {
-                ret = -1;
                 break;
             }
         } else if (ret == 0) {
-- 
1.7.11.7

