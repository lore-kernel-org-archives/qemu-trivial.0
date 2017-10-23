Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e6kMu-00009i-Nr
	for mharc-qemu-trivial@gnu.org; Mon, 23 Oct 2017 17:34:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6kMs-00007B-3S
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 17:34:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6kMr-0000Jh-DD
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 17:34:42 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:48814)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6kMl-0000Dj-9u; Mon, 23 Oct 2017 17:34:35 -0400
Received: by mail-qk0-x241.google.com with SMTP id d67so23887449qkg.5;
	Mon, 23 Oct 2017 14:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sFvmgZBDtIZ8nFzbsfeezzshyUEzTZWIz4/26GdZz4I=;
	b=WQvzuAaUZHfx71AmDPxcWIe3/7MvCXIMN3kUzz1sOa/ylHtHyzF26I+e6URIjRoKZn
	+NCbpdLKbBkpxeiK5AWaXCGBOfZxdKeFF2pC+KpwY/qCNmC4We/xCPbBzfRTImthEzeQ
	ovMMN0At5izOx/YiRxkUd1B0LTtuGbYoaudceJn88hkgg/FkTRaRGTCZ62iAgt9cP4Ze
	3Z3ctn6HV2e8r7ZOajT/bd9fa7LkLcBjyTH9k4VlM4ZDOuRMv9ez8o1tEzrfq1eQR/KC
	zgUz7o2CMqiQeMKBlXmqQmna0e/jBrw3OlQ3nXl2uNKeQBTe3tr8iPQq6/L8gqEQSYZ3
	M0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=sFvmgZBDtIZ8nFzbsfeezzshyUEzTZWIz4/26GdZz4I=;
	b=asAksL7PbIj4JUDU5ssNUZ/P7MJmVIEvc9Wza1/hUNtPg1rKcmUECFZBdOk79n4iCO
	nij0gWvXXn+tG5nxd6kq1hQSoWmE76vCEk8JP9d45DTNWmkWFOsK2L1nL1EiOS8mSocZ
	o8syla9SmJmjV91IEcmry57hm49se3x0xINKnb9QlCwbL5oYW3cXheoFPdSj/hZQAFEU
	oSNXX8EhMsY92pLEBqNpZHTFm8TcZZjQVx5eNUXl+RYi8GUqh9gtgCYHI5Msa5wVSuvW
	hshLH8axzIAnkjvGLjbY6c3DSzerETyedM/hDmDfAiyJK8O2xz/hjA37Qo4XcMqu9a7O
	bMvw==
X-Gm-Message-State: AMCzsaXY3r+rmLnho/FwUBENC0E/HrWDwi6/d33BC5AmfpDHPooOpDtL
	WF7rrh8OOynpYNSMDjgJnfo=
X-Google-Smtp-Source: ABhQp+RmPhVcPFLfhRhRP5LH4nGvywUrk7DmqT6oRjPuQ2fpYohRFq+I45To30aSP9N/W/CYEMd8Xg==
X-Received: by 10.55.59.131 with SMTP id i125mr20519224qka.93.1508794474775;
	Mon, 23 Oct 2017 14:34:34 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	s51sm5568381qtk.32.2017.10.23.14.34.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Oct 2017 14:34:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	"Richard W . M . Jones" <rjones@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Date: Mon, 23 Oct 2017 18:33:59 -0300
Message-Id: <20171023213359.23025-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc1
In-Reply-To: <20171023213359.23025-1-f4bug@amsat.org>
References: <20171023213359.23025-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH 3/3] vl: remove unnecessary #ifdef CONFIG_TPM
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
X-List-Received-Date: Mon, 23 Oct 2017 21:34:43 -0000

a stub is now provided.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 vl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/vl.c b/vl.c
index 0723835bbf..ec299099ff 100644
--- a/vl.c
+++ b/vl.c
@@ -4624,11 +4624,9 @@ int main(int argc, char **argv, char **envp)
         exit(1);
     }
 
-#ifdef CONFIG_TPM
     if (tpm_init() < 0) {
         exit(1);
     }
-#endif
 
     /* init the bluetooth world */
     if (foreach_device_config(DEV_BT, bt_parse))
-- 
2.15.0.rc1


