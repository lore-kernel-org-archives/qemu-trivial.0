Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxx5-00044c-Qm
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:36:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47438)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxwz-0003zt-JI
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxwy-00031O-UN
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:37 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:34069)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxwu-0002vy-GW; Fri, 28 Jul 2017 01:36:32 -0400
Received: by mail-qk0-x241.google.com with SMTP id q66so20241389qki.1;
	Thu, 27 Jul 2017 22:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ocdKODMDRblQ3CXszdmAGKmmeOXV74eaH0HmN1f49mA=;
	b=gfmIWH/KHQwAHQ7tXBsur37DcXg59derO1MxlW47/IJM2RPCtWs4t5PzF0mw3i9ej0
	GUTmv3AaU9cj7EJrsDkGTcL+aczz02PzywRjC0gu8T0fyLeYyzSnMzSa+UAZrxtSOBEP
	BNqEPu/+bWbo27Qft4+4jd60Eo6qZyryh45ODFlZgjAlcarWjm9og2y9RivQEiUtlnGt
	tnSuWd0g/xHNOA2yJkqX3cGvKn0kEwiKTcyw73qYAoYoyYwBoAi7OYrBYwIiUt7gnpSy
	Aw4TbfuZwljl0RGrW/Jm08LPBVcoaZCx5klp1mXumT4QAbdTROceBp80WDb8E9JEBlvX
	T+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ocdKODMDRblQ3CXszdmAGKmmeOXV74eaH0HmN1f49mA=;
	b=fZfIwV1zXH/JxD1du0FSe7YgAiepVVFkTwnvKoUkqPgtoNsCD10HJW0SmM+/mhUtsG
	bFkSfkY2gdxAFNWkRFShQNxNl0VYFaVqupdb9c90EwGQD5pKa4x5YU7PDHQdOrffHhNo
	9hxsPz2HhKh7QlpEtFJ9av9rQhJ2Sr5eJ2GeDGpUTM3nGbHjB0r9I1jXn0YMLEvZuW15
	fGzv7nqYcopr+qgHUr9rkpDwY/gz9gvOFyusZ3yilMutySo45IkPU5On1VzdBeEoQppO
	h65+niVU758sgt9axrUciWjZhYTg1itvKiyCPwNzu5JJsQsVWqL5p7ZrLXBxbyUFbxnJ
	scGg==
X-Gm-Message-State: AIVw112NUmSS/tbXXWb0SMngsjF9G2eIDCY75dy6WMGJSTJZW5Zdb4CZ
	iMFUuBE7XvsNHA==
X-Received: by 10.55.101.135 with SMTP id z129mr8427626qkb.164.1501220191988; 
	Thu, 27 Jul 2017 22:36:31 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.36.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:36:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:27 -0300
Message-Id: <20170728053610.15770-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH 04/47] MAINTAINERS: add missing USB entry
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
X-List-Received-Date: Fri, 28 Jul 2017 05:36:40 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f10252c292..3b472d7a09 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1008,6 +1008,7 @@ F: docs/usb2.txt
 F: docs/usb-storage.txt
 F: include/hw/usb.h
 F: include/hw/usb/
+F: default-configs/usb.mak
 
 USB (serial adapter)
 M: Gerd Hoffmann <kraxel@redhat.com>
-- 
2.13.3


