Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fW394-0004jB-0z
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jun 2018 13:13:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW392-0004hN-4p
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 13:13:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW390-000238-Vb
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 13:13:16 -0400
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229]:39821)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW38w-00020z-SK; Thu, 21 Jun 2018 13:13:10 -0400
Received: by mail-qt0-x229.google.com with SMTP id p23-v6so3518530qtn.6;
	Thu, 21 Jun 2018 10:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KaKONEZCeP1O8NcsyOMN2P4LQq70QG0QhMhxmD+h9EY=;
	b=GrC1LVfMniV7xx9c09ZKtnBq2d15oVUdPsbe/EMaqKJC9a0OvsdcNqODOqYBSFTC4n
	oMDosAeeV10VcmvsG7eokEBz2jdeNKzfqLmHgZRWoNEDTy4tqJ7OFtLqqLQZcnCDLSwN
	9F5Jpl14XRrxD0JzJhZN8Mn4R1bTsBnNy9ULXTDuSsithgPZEItZTvcMYl/qIIlljWvc
	FvjOBuewKSUEjJl+eRcPNe7Vf7r/hjMnxDCCBGU8NjVkt5Ca3NrmHi+P+BfH2L9AxYxp
	XP4k9ZGYxGqtC+SWBl8xuCBZfaGf0dVgjzSy9mk8pCIgCFXNBKNgpPZxeYmBmAq9x46c
	WZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=KaKONEZCeP1O8NcsyOMN2P4LQq70QG0QhMhxmD+h9EY=;
	b=NZFe773Jy7nTSx9cQPlCuoTaBH94Gk6Nx0OZVOrzWegTa3RFYZAMxNLQAlz8HYyTZH
	adByNFqYXg1tzoADX5D+wMaOIl5AIhqKz+uibT3pHjutOacG4kwsxLYY0A/Z3uWqDc2E
	qhDZzXLDBtdSTpxOMGPFq0z7Y/dXrC+QHtH/PayH7Z7XuR3nzTsOm88BjS3MswDTI8HA
	Q3rQdbWldvFUO0jyaee26ACGBxCKQ2aq01+JGS3NnPvES3fVfhpi+PJzyvxtdZYEJSpg
	XCBcKxgRWzv8okvgwLhwykkZ/+WIJSzWyXIYHR6Uh85cR6VrgSdYBoHKXP58BgMbA9ZT
	L94g==
X-Gm-Message-State: APt69E3Ji92RIUrEQhltoklDxgAfupNutv6ZXH3bCXV/hlUFa572zUhh
	M56omF67JtWf+SVN/bOlFwM=
X-Google-Smtp-Source: ADUXVKLWYQQTfjyihHsCz/VXv0jgaDzUZOuUHq3LjEqDYf+j5sdO/ZWRCvAD6GTu2KGJRQmJ9/73IQ==
X-Received: by 2002:aed:22cc:: with SMTP id
	q12-v6mr23381171qtc.226.1529601190259; 
	Thu, 21 Jun 2018 10:13:10 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	t14-v6sm3166159qtp.65.2018.06.21.10.13.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 10:13:09 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Thu, 21 Jun 2018 14:12:47 -0300
Message-Id: <20180621171257.14897-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621171257.14897-1-f4bug@amsat.org>
References: <20180621171257.14897-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::229
Subject: [Qemu-trivial] [PATCH 01/11] trace: Fix format string for the
 struct timeval members casted to size_t
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
X-List-Received-Date: Thu, 21 Jun 2018 17:13:17 -0000

This fixes when using GCC with -Wformat-signedness:

    migration/trace.h: In function ‘_nocheck__trace_dirty_bitmap_load_success’:
    migration/trace.h:6368:24: error: format ‘%zd’ expects argument of type ‘signed size_t’, but argument 3 has type ‘long unsigned int’ [-Werror=format=]
      qemu_log("%d@%zd.%06zd:dirty_bitmap_load_success " "" "\n",
                   ~~^
                   %ld
    migration/trace.h:6370:18:
               (size_t)_now.tv_sec, (size_t)_now.tv_usec
               ~~~~~~~~~~~~~~~~~~~
    migration/trace.h:6368:30: error: format ‘%zd’ expects argument of type ‘signed size_t’, but argument 4 has type ‘long unsigned int’ [-Werror=format=]
      qemu_log("%d@%zd.%06zd:dirty_bitmap_load_success " "" "\n",
                       ~~~~^
                       %06ld
    migration/trace.h:6370:39:
               (size_t)_now.tv_sec, (size_t)_now.tv_usec
                                    ~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 scripts/tracetool/backend/log.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tracetool/backend/log.py b/scripts/tracetool/backend/log.py
index 78933d03ad..6751f41bc5 100644
--- a/scripts/tracetool/backend/log.py
+++ b/scripts/tracetool/backend/log.py
@@ -38,7 +38,7 @@ def generate_h(event, group):
     out('    if (%(cond)s && qemu_loglevel_mask(LOG_TRACE)) {',
         '        struct timeval _now;',
         '        gettimeofday(&_now, NULL);',
-        '        qemu_log("%%d@%%zd.%%06zd:%(name)s " %(fmt)s "\\n",',
+        '        qemu_log("%%d@%%zu.%%06zu:%(name)s " %(fmt)s "\\n",',
         '                 getpid(),',
         '                 (size_t)_now.tv_sec, (size_t)_now.tv_usec',
         '                 %(argnames)s);',
-- 
2.18.0.rc2


