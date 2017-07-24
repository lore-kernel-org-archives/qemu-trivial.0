Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi5g-0008Do-In
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:28:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5c-0008BB-TU
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5c-0004jB-4e
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:20 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:32863)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5a-0004iV-2N; Mon, 24 Jul 2017 14:28:18 -0400
Received: by mail-qt0-x241.google.com with SMTP id n42so3126732qtn.0;
	Mon, 24 Jul 2017 11:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WcqnCQ/ToTRAQymS8Tq8QZzva+ADZC7U5pEV8ND91pE=;
	b=VisBhtr8JebtWQEJMz0rYus2jqMdY0hSEFzqlTfWVUDtBFnITuzq4dLuz/SR7GjD2x
	vu2riuLQ078AMmHOA3ZjnZim+eeVhjvz7kjOfh8ptzvL8foeFgCGPBOIC4Br9KxKj7tR
	4bpqI4qXqKMN/i39Z5uQBacc7lBX/HVzBIJBlT9G0uKvLZsXylA6Z2gffu+d7Mb8Stur
	YZ0nh5efihb3ZX4iqiGacB+k2TwP5ojbkzGA4LsOs8bP+YSXfxU73VPPr/HBuyTBRLbK
	06n2ZPzcBAfDJwzSDmfZAz9RpzFrVrGICDY2kyobofYEvfTdFrxoUVmReEWorwLkT+aj
	9Y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=WcqnCQ/ToTRAQymS8Tq8QZzva+ADZC7U5pEV8ND91pE=;
	b=hLv3U1yCJpTYXpDEwR3L2wfiVdDZJo5HbMdZzEENAgceLiviLrNEDYhsjC1NCKAb4z
	xPMydmoo1wLjzciThDQw3J250E4Ze4N+0stlbdYAXq6fl94O5ONQtOPi6og+WvZoSIKZ
	p7jEnrFBVJVQT+ISe2YrD7q0VaiVDlSXWVkBYhjujw/427WGKrT9CACtxRI82G2Efzc2
	CunyAO6pAj9ImKQzXZQ5i3BAipYNMALTBCUNSGpIwlcTbsJuk8sDQkM2dt771wCX0QdP
	jb+HKpi203EzlMz7rzeSlgpIm2voYTaOYttgdkvAFDKjtoJVxxCSGZKQMhPvXhNPqTyl
	nYVA==
X-Gm-Message-State: AIVw112z8fDb8+FQKx1riAPpiBu2jRbzgqcAJugQ4+IzpMnSQ8sYZr4+
	UmgvjFTn9k1mwg==
X-Received: by 10.200.37.206 with SMTP id f14mr20640733qtf.271.1500920897381; 
	Mon, 24 Jul 2017 11:28:17 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.28.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:28:16 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 24 Jul 2017 15:27:18 -0300
Message-Id: <20170724182751.18261-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH for 2.10 02/35] loader: check
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
X-List-Received-Date: Mon, 24 Jul 2017 18:28:21 -0000

since a negative value means it errored.

hw/core/loader.c:149:9: warning: Loss of sign in implicit conversion
    if (size > max_sz) {
        ^~~~
hw/core/loader.c:171:9: warning: Loss of sign in implicit conversion
    if (size > memory_region_size(mr)) {
        ^~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


