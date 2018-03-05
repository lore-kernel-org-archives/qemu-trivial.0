Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoHj-0003Vq-4v
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:28:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHe-0003Pw-0x
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHd-0006wy-85
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:27:58 -0500
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:43372)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHd-0006wO-1E; Mon, 05 Mar 2018 06:27:57 -0500
Received: by mail-wr0-x244.google.com with SMTP id u49so16841141wrc.10;
	Mon, 05 Mar 2018 03:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3LcKid4DgyvS7fM4qtMdfog+Te+/C/zqKxlCiBnvs4E=;
	b=rkDEOrMaBUGkiy7Wa+jAAH/6vmrDfUVifTIocae+4EBZADsuVo9y2dImYJq4zK2lPB
	L3o5z/qh6GDZuoZl8Wxh/CGukSIpukeeudDUz4n7bedEMMy1zVOvk1KplTpiZp7jZyy7
	7qcPwXXmX/opdH46KLfWaGgdMAnlAsBUVcMSR4mu3R3zlq993mbMrZ0ao1MfSu+VoNj9
	w3+mJk87TWy9q7sAkQr5U8fPiuw6qtffKQHjuklZ85dZ6IavuO/Yyot/giaWkW4jcr4m
	ZV/FKS+M7HaF4MhAChiRUhztdqTbC9XDFIdcixEwUCXsGiMQnxt6+Wcv6dCVvtiByTYm
	WNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=3LcKid4DgyvS7fM4qtMdfog+Te+/C/zqKxlCiBnvs4E=;
	b=KC8VZRX2w6jzYlN7Cyd6C3B36o7ucJpPTP8r/R3Ek6Czhe+3/FbB8YuBGWgvodPsjw
	iH3hnxA4oZuQRKavFBVo0WCNdrL4O8UDjda7/d75zrnIUQZXmsz6dH+K6SXZMixMUwRp
	l7EKzBsEBX5UbBSackBraRQ3GkMxFu7GjrGA5lIS3KJKGZSnBOtlmJYaQ2F+fJpffHUj
	NpFS7TSYIGfc93KM9vhdSDgfFbr4Elb5dXymGbgUtM+BdBSB8+HT2uJtcSvonQ8ydz+8
	Th9wyuT8TJ4lhebiIE+6VPRWHo7qi4OEw5trz+B1WJNI98LuSCp4N0khlrzGp5S86mkc
	E4PA==
X-Gm-Message-State: APf1xPCJAm09B5HhfknnMsV9IFuLBq0W6Gbzv/tXRzOaUmb9jMD4ssAc
	3C1eFarKHxhLMNwPOFtHye7BeQsN
X-Google-Smtp-Source: AG47ELtSh3wXRd1HknatG1ow9Z/5UUHNzwnJu9GGpk8RK0oenAB7QSaLAyXUfv1sAoSA2n8VFaARMg==
X-Received: by 10.223.136.72 with SMTP id e8mr11558992wre.163.1520249275851;
	Mon, 05 Mar 2018 03:27:55 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.27.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:27:55 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Alexander Graf <agraf@suse.de>,
	David Hildenbrand <david@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-s390x@nongnu.org (open list:S390)
Date: Mon,  5 Mar 2018 08:27:13 -0300
Message-Id: <20180305112732.26471-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: [Qemu-trivial] [PATCH v2 11/30] hw/s390x: use the BYTE-based
 definitions
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
X-List-Received-Date: Mon, 05 Mar 2018 11:28:01 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/s390x/sclp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index 047d577313..2ffec8f675 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -288,8 +288,8 @@ static void sclp_realize(DeviceState *dev, Error **errp)
 
     ret = s390_set_memory_limit(machine->maxram_size, &hw_limit);
     if (ret == -E2BIG) {
-        error_setg(&err, "host supports a maximum of %" PRIu64 " GB",
-                   hw_limit >> 30);
+        error_setg(&err, "host supports a maximum of %llu GB",
+                   hw_limit / G_BYTE);
     } else if (ret) {
         error_setg(&err, "setting the guest size failed");
     }
-- 
2.16.2


