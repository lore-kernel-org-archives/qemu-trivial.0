Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWwIn-0004Cf-Rh
	for mharc-qemu-trivial@gnu.org; Sun, 24 Jun 2018 00:07:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIj-00047h-NZ
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:06:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIi-0004Es-VH
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:06:57 -0400
Received: from mail-qt0-x236.google.com ([2607:f8b0:400d:c0d::236]:34044)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIe-0004B4-KB; Sun, 24 Jun 2018 00:06:52 -0400
Received: by mail-qt0-x236.google.com with SMTP id b20-v6so116064qtp.1;
	Sat, 23 Jun 2018 21:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=TIXNmx8bHFDGQeXkU9pywFHui8WZcwIyPpPA/o4klWw=;
	b=lfjZBlJybsLxH5E245eMIN8lxm+xpXOCXptjC+VJ7a06Hi/furEaEXwcRdKLIq/HgD
	y5pT6KJJmfCPGIB67s5LRmE/qHTrQZQXFveHy3KPdzL19wUELUtlLpBimVvzmqeqRmHM
	z037QUs0vl9yCSUe5XNjhD/Fi6ty6FhrkjQqEkkxo4S7ekKyKVaEIWzCBQJJcA2XuFYn
	Rg2+yPLrrkZN+pEOcsP3cD9aGGiDM7PJKeDaUrZJyRVcoxIJyQmXvO6dQykbOihSqq6D
	15+pBpAd36QDxm/dGTn3RzgofEnJt+rBPz63vUGS2wNkYK9uygT+DV7gcV8PTcqYK39L
	wKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=TIXNmx8bHFDGQeXkU9pywFHui8WZcwIyPpPA/o4klWw=;
	b=mOA2/mdh5ipbVKihqMonZW3bUVTAXYkn0wYkOZTUQU62i0FNYyrOfxrnTuS1aA3shQ
	Wc9zKbCD4TR8mQI3/6/oOiB7sC/pnO2zoHumghli0vjlOIs/F0ANYwavOXMaOUb8PrwQ
	opAM792hssBcL27FQ3o30QFVaVdpelsGefSmryk8CA3fMHyIl4/+P86D143kqeZicFum
	srlhi44f2EaQDMLLdh4tEhbYnMdwso+O5pJfAwlSpXtvikytqpTFxRX1QRhBRfdTSQSa
	VD+e3PGpDPuYQp/Y9o0VyLQCf4lC3gFs+EQnUiXbW+oK/ZTwZ9GYqR4Ub5qvVpCcOBPy
	G8Dw==
X-Gm-Message-State: APt69E1RKGTWSlvsIc0bQ7iWPy9ZY+40zDgOaku5TbTPpZLHM1xFrrSF
	yCbtxpOhkDXzgw2lGzn0fWo=
X-Google-Smtp-Source: AAOMgpe2BGhn42RrXBKj3BKGQowRqHyV0OB8DS8GECZmZG2kG2gtXt7ahxLJgDPmGSgT5FCYMwKoiQ==
X-Received: by 2002:aed:3bab:: with SMTP id
	r40-v6mr6466419qte.96.1529813212102; 
	Sat, 23 Jun 2018 21:06:52 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.06.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:06:51 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Sun, 24 Jun 2018 01:06:03 -0300
Message-Id: <20180624040609.17572-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::236
Subject: [Qemu-trivial] [PATCH v3 10/16] hw/arm/stellaris: Use
 qemu_log_mask(UNIMP) instead of fprintf
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
X-List-Received-Date: Sun, 24 Jun 2018 04:06:58 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/stellaris.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index a8f1f6a912..d06e366402 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -560,7 +560,7 @@ static void ssys_write(void *opaque, hwaddr offset,
     case 0x040: /* SRCR0 */
     case 0x044: /* SRCR1 */
     case 0x048: /* SRCR2 */
-        fprintf(stderr, "Peripheral reset not implemented\n");
+        qemu_log_mask(LOG_UNIMP, "Peripheral reset not implemented\n");
         break;
     case 0x054: /* IMC */
         s->int_mask = value & 0x7f;
-- 
2.18.0


