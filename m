Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e6yCg-0006LT-Nz
	for mharc-qemu-trivial@gnu.org; Tue, 24 Oct 2017 08:21:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6yCf-0006JG-45
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 08:21:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6yCe-000741-5y
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 08:21:05 -0400
Received: from mail-qk0-x22e.google.com ([2607:f8b0:400d:c09::22e]:54228)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6yCX-0006yt-B5; Tue, 24 Oct 2017 08:20:57 -0400
Received: by mail-qk0-x22e.google.com with SMTP id y23so25910425qkb.10;
	Tue, 24 Oct 2017 05:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dfud2ynMY4Sv3gLUO7PQZENQdgYKERWbiVup3T5FMso=;
	b=V6xlEkzsXynxo/FQxM2oH70eU6lAFwFagCF2fJKTAguXWsTBSrcDoWcbl/ZFt8gqOT
	TD7lnSDUy9W9b6cDtxCzZvnWix6LGrRxJnPzFHeTSZOXA6qwRlkE+HPdlyYwTfMGJjzE
	EURQH51iQjb2LxsSH2/If8F5+tA1cc1xiekoWjOjIPQzV4URF9g5S8tHwfCCl2JmBP0Z
	5vv7lYSDeiQn9nezKjSq4VX1M3GrNZd0srPrvBekDDUxXnr18Cl1eK19SDg7kCxxP3K8
	jamDkqNJajssLNEeSj+lYHMXg1fQYZB0e/DmgZ7qrqu1qPTX7m8fOhWFfbaZqMq5h203
	9+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=dfud2ynMY4Sv3gLUO7PQZENQdgYKERWbiVup3T5FMso=;
	b=F6SzeQtlVDLI4Md9pUUU/UNuNorGuBEqCzKpfctyzudTABZrna/CR9xEM0qMYcwve0
	kjm9EtNkbJRvTvxk6FVeZbLT/zmD+Raq+NRmXxZJxvlAhO1Ql1eSkZqlNGUuqfwA0lFE
	u9yRvSCRMm1rUIKlqXV3+DzUTaxovISmCbOp80HqKD+/sfKUHmKYyOZz+cYJaiZJ/lGi
	YQtZl5/B/u244vx8C1kFXEazmTAvBvGdoaW58n3zQ88lUytEZ3t9Ax5+IapyFM1Lxcsr
	rlL9uhXwKB4wMstbGBmk1Ns4uoM/ouLpdgADCs31uCmh6XR4+hyuQ4XFSPwbekQqnQh4
	fptQ==
X-Gm-Message-State: AMCzsaX4yRAySUqAvon4kgHW7sDGiv8cit4EFsJgLZ28MDvePCC35bcQ
	+D+wkBPf9NbN9A6HofXYjm0=
X-Google-Smtp-Source: ABhQp+TKVKmWU5n2tdp0RLXoK6MPmO1WcFt42qs5gfJ3BuIowuIC106dJh2EVFK4qf6omFS2f7ARtA==
X-Received: by 10.55.43.75 with SMTP id r72mr21837073qkh.307.1508847656503;
	Tue, 24 Oct 2017 05:20:56 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id n76sm103983qkn.85.2017.10.24.05.20.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Oct 2017 05:20:55 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	"Richard W . M . Jones" <rjones@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Amarnath Valluri <amarnath.valluri@intel.com>,
	Juan Quintela <quintela@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Peter Xu <peterx@redhat.com>
Date: Tue, 24 Oct 2017 09:20:41 -0300
Message-Id: <20171024122045.30072-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22e
Subject: [Qemu-trivial] [PATCH v2 0/4] tpm: add stubs to fix compiling with
 --disable-tpm
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
X-List-Received-Date: Tue, 24 Oct 2017 12:21:06 -0000

This fixes building with --disable-tpm as reported by Zoltan:
  http://lists.nongnu.org/archive/html/qemu-devel/2017-10/msg05369.html

Cc'ing Peter in case this enters as a build fix instead of via trivial.

v2:
- added Richard W.M. Jones Tested-by tag
- remove #ifdef CONFIG_TPM in tpm.c (Stefan Berger)

Regards,

Phil.

PD: I missed Amarnath Valluri in my first series, you might want to add yourself
    a R: tag in MAINTAINTERS.
    
Philippe Mathieu-Daudé (4):
  tpm: add missing include
  tpm: add stubs
  tpm: remove unnecessary #ifdef CONFIG_TPM
  vl: remove unnecessary #ifdef CONFIG_TPM

 Makefile.objs        |  2 +-
 include/sysemu/tpm.h |  1 +
 stubs/tpm.c          | 33 +++++++++++++++++++++++++++++++++
 tpm.c                |  4 ----
 vl.c                 |  2 --
 MAINTAINERS          |  1 +
 stubs/Makefile.objs  |  1 +
 7 files changed, 37 insertions(+), 7 deletions(-)
 create mode 100644 stubs/tpm.c

-- 
2.15.0.rc1


