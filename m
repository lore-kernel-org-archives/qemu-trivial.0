Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aRWta-0006zE-NB
	for mharc-qemu-trivial@gnu.org; Thu, 04 Feb 2016 22:17:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <daniel.serpell@gmail.com>) id 1aRPBw-0001VN-H1
	for qemu-trivial@nongnu.org; Thu, 04 Feb 2016 14:03:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <daniel.serpell@gmail.com>) id 1aRPBv-0005cG-Pc
	for qemu-trivial@nongnu.org; Thu, 04 Feb 2016 14:03:44 -0500
Received: from mail-qk0-x229.google.com ([2607:f8b0:400d:c09::229]:33784)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <daniel.serpell@gmail.com>)
	id 1aRPBr-0005bK-KV; Thu, 04 Feb 2016 14:03:39 -0500
Received: by mail-qk0-x229.google.com with SMTP id s5so25074021qkd.0;
	Thu, 04 Feb 2016 11:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ef3lCMDjgii85b9NYM/+nwnCjIlOcJy8RZ6xVtTm+1A=;
	b=A2TXSL2/3XHmtnKwhJiW2G9g7m/vKRuY1hVv1GBxAHXjEnXgsRRDlx97y7aHGxcbdS
	xVOImdaouv8joWbvzAfMsrwrFTbc1jDsTK/1j9AXhb6tVYoWkTlAvYyYlxtme33QVKvo
	/gl+YYwMvig7PLocJ3BzVX9YvBKax4Qtd5XAnvOE8GX9XkXXq1eZ8ZglAGhHRBRMYvYC
	VMSUg5FiaFAzaCxaxhnDPlu7xCrR8YXR6oHOoQ5iYVGJAviMhloBSG1RdrHtC3ncQqH9
	MUvkXq0JJhghRnGngqLuXofRTIjac6PLBYpDc2yFs76Oh4bOZvd18I+B05vNU//KQMEr
	8lkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ef3lCMDjgii85b9NYM/+nwnCjIlOcJy8RZ6xVtTm+1A=;
	b=N+Dmn44ZVUE7WGuOnFIGE/mal7ZhcIHEevkkfCUypAMxNt5bSLiVzzvPDDcmoq4JlL
	Amrd9gazr1t+gBDXNcun0gYp6m962KrfeczDRcYO4kOo9tnbNEtCAN7oPFCFAsayCgfv
	z+cxv1yT5/s2/gsWeaaoLRdrrUuAuxNRFFBtege4yBGBUyDofFrJDdOQ0P6d6sFQe7iU
	S8H9CW8hqsmjUyG0ydM7FuhWK10WCOP5NXXr+Q4iAyRZeRE0pwOsQYAh2KEWhMoSYJ88
	g/vO4caK1uFTLJz9DQHPLoeZqtACUlddh3jGLUqkIl7AvS8LTyLpnSeKHh2XK+hdKBBY
	s+Ng==
X-Gm-Message-State: AG10YOTxaiKLmCH12XJKF4uhnYH1YWM93xiSZCVcItasSkj4IBz1RaEeMSwZSnGZhyOJVw==
X-Received: by 10.55.78.207 with SMTP id c198mr11084832qkb.34.1454612619035;
	Thu, 04 Feb 2016 11:03:39 -0800 (PST)
Received: from pcdaniel.aplik (pc-203-22-241-201.cm.vtr.net. [201.241.22.203])
	by smtp.gmail.com with ESMTPSA id
	d64sm5849038qgd.9.2016.02.04.11.03.36
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Thu, 04 Feb 2016 11:03:38 -0800 (PST)
Received: by pcdaniel.aplik (sSMTP sendmail emulation);
	Thu, 04 Feb 2016 16:04:07 -0300
From: Daniel Serpell <daniel.serpell@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  4 Feb 2016 16:03:39 -0300
Message-Id: <1454612620-7819-1-git-send-email-daniel.serpell@gmail.com>
X-Mailer: git-send-email 2.7.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::229
X-Mailman-Approved-At: Thu, 04 Feb 2016 22:17:16 -0500
Cc: qemu-trivial@nongnu.org, Daniel Serpell <daniel.serpell@gmail.com>
Subject: [Qemu-trivial] [PATCH] Fixes missing key in usb keyboard emulation
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
X-List-Received-Date: Thu, 04 Feb 2016 19:03:45 -0000

Hi,

This one-liner patch adds a translation entry for the key that is between
left shift and 'Z' on international keyboards, enabling its use in the
usb keyboard device emulation.

Daniel Serpell (1):
  Adds keycode 86 to the hid_usage_keys translation table.

 hw/input/hid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.7.0


