Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi6E-0000Wq-Ul
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:28:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6C-0000Uh-Vj
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6C-0004ze-59
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:56 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:38092)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6A-0004xp-51; Mon, 24 Jul 2017 14:28:54 -0400
Received: by mail-qk0-x242.google.com with SMTP id t2so10677854qkc.5;
	Mon, 24 Jul 2017 11:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pH/WInsFUCmdsdj7T+VRO9OJJrleVPwyIwIK4KP7U10=;
	b=rYGPJsqpJ0wvjbdxYFrj9b7ZuQoo2OG5iZDhm/Rka3+7G/s1nNs3l+UWHRpBoIhwpc
	W0fMDIdex7NgMKaNVP08PrpkTYeTJ9DJRd7/luVMTbF0zcbCy71a6vRD3t+M+A5gV76x
	oOiiOTgwWimFlPOVFv9137l7AyyXwh17CB6ttE1J0cNRJvzV8RdzDQ3B0QDBaGgxrfKJ
	BDSruSlsz5xSDgHZSBnmfEDFn9AhuYbXLE1wFmdiFU5axsxPfSrozqkVunNgs7lAQPcw
	PVSFs5itQXlobuyNCzDaHMd73krxp3ldjhbA2lUu4qbQbnUppy2sL7kZfKai2MApgE4e
	IxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=pH/WInsFUCmdsdj7T+VRO9OJJrleVPwyIwIK4KP7U10=;
	b=LbDyHnYV9i/OB9fqM9SKJ/oNeAW8sqJRhESJorsL1kA4w8e7Ksv9lxfWHHyFcCCsZR
	9OJU8sz9v8npYuEnZFzNjlayrPAef23M+Sv5tJCA0vdVWDLnv08pdoNseL8uivnUeSnB
	KcS/GA2oB78bDxwneANaHp3DDbzkokfUyed1xkUqitZ8tMUFd8eZPmz08is/cTlGfrI6
	fSKasBt5d/rEuQhUw2XKTUlGgqBPIQinJGzHL6j1+CqZhkAVeD8ZtnrE/TP3eDXPyT7z
	1c26fSzBJfW5cd212eJRF6DHlgTeV1xYM+EpewCbMdZE/5YIgTQpF0EHbh4YzuMaoV9i
	AADQ==
X-Gm-Message-State: AIVw110uNQwIlPF8s/UQJT0TrutAHvkikvxnhUFdOmZtOtyo3hKwJboG
	jwhWGjwU5HNV9Y6MWPJwVQ==
X-Received: by 10.55.43.144 with SMTP id r16mr20731626qkr.59.1500920933701;
	Mon, 24 Jul 2017 11:28:53 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.28.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:28:53 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 24 Jul 2017 15:27:31 -0300
Message-Id: <20170724182751.18261-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH for 2.10 15/35] usb: correctly handle Zero
 Length Packets
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
X-List-Received-Date: Mon, 24 Jul 2017 18:28:58 -0000

USB Specification Revision 2.0, §5.5.3:
  The Data stage of a control transfer from an endpoint to the host is complete when the endpoint does one of the following:
  • Has transferred exactly the amount of data specified during the Setup stage
  • Transfers a packet with a payload size less than wMaxPacketSize or transfers a zero-length packet"

hw/usb/redirect.c:802:9: warning: Declared variable-length array (VLA) has zero size
        uint8_t buf[size];
        ^~~~~~~~~~~ ~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/redirect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 5e42730449..5b7073d2cd 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -795,7 +795,7 @@ static void usbredir_handle_bulk_data(USBRedirDevice *dev, USBPacket *p,
            usbredirparser_peer_has_cap(dev->parser,
                                        usb_redir_cap_32bits_bulk_length));
 
-    if (ep & USB_DIR_IN) {
+    if (ep & USB_DIR_IN || size == 0) {
         usbredirparser_send_bulk_packet(dev->parser, p->id,
                                         &bulk_packet, NULL, 0);
     } else {
-- 
2.13.3


