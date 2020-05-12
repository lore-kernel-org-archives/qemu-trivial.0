Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jYSDP-0006Mn-QP
	for mharc-qemu-trivial@gnu.org; Tue, 12 May 2020 06:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jYSDN-0006JN-Tq
 for qemu-trivial@nongnu.org; Tue, 12 May 2020 06:32:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27010
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jYSDN-0007Sm-6W
 for qemu-trivial@nongnu.org; Tue, 12 May 2020 06:32:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589279564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=D3s9LSGcZEYro7u0ScBs6UfFzzI5QWTXiQteI6q/kVs=;
 b=Q/pAH9mxXJarZLgrUdMadrFo65LuiQTPtOSuIqUFmEuTzxPs3G2FQe8RXBG6ksYip/Erzy
 AO7xfS5Be1DtSMLa9Z0lHwPYZ400ijdPhNwvGX124Pwj4u8DatmNClkaLwVu+rG1mvtFkc
 oAwe/8sfR++Rv53Ecen5X/QMXbTwag0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-ksGU1VnuNCG8F9RfSJ9lMQ-1; Tue, 12 May 2020 06:32:41 -0400
X-MC-Unique: ksGU1VnuNCG8F9RfSJ9lMQ-1
Received: by mail-wm1-f71.google.com with SMTP id g10so2811937wme.0
 for <qemu-trivial@nongnu.org>; Tue, 12 May 2020 03:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D3s9LSGcZEYro7u0ScBs6UfFzzI5QWTXiQteI6q/kVs=;
 b=dMJ+SosJD1V6kWUt++1HuAW/Wgz5d/OHsYXZDvzziaO7uHi9aJ0xcLo2NCPSudtSDQ
 CM9zUIiElYBLqd3geretcYJUvqOCq87PaLYIeKfxryXdXTrgMTFp8VH9ePlJTm+6X1Rs
 7BTr8S4RUuGSfYlNoAjl9Nrb/BBAElDsTwE4N1lKsrpE5lPUOEzB9DZT6w3tFzfVcipg
 AmA1N/fWyQBb6m2+ARaDIbSzTUG5pVQrfpWro4xYbWUF3l/4NHb8zzHKMLMI/cAPoEXJ
 G1m1ps0m+tFqW4l7aZDM3tZqX+uEJoWTQ6yVOByP/RnSJHbJT4M3oud0JA3DnznPdThb
 kxMQ==
X-Gm-Message-State: AGi0PuadxjvCJz8jfTOhv+qHsTNAQQa83MkAh+2xtcpDbAZ8pcrSUo+o
 TDjT9VjR+gu5C9sFuLmjrfMfSUUWExzZcb6lYZGphRdvRToQaCQDTYD/w4JRn5H01JI2r0qUkTL
 PO9RzohbEEiyqaryMsA==
X-Received: by 2002:a7b:c4da:: with SMTP id g26mr20748012wmk.3.1589279560418; 
 Tue, 12 May 2020 03:32:40 -0700 (PDT)
X-Google-Smtp-Source: APiQypI7UX/2eCYXEuygt24GZ0cIrBaT7G/B+iwW2cYEEuIZJysOnDbHZJBLcIIaLOSrWhvw7mpSHA==
X-Received: by 2002:a7b:c4da:: with SMTP id g26mr20747977wmk.3.1589279560089; 
 Tue, 12 May 2020 03:32:40 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id x5sm23249077wro.12.2020.05.12.03.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 03:32:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, kvm@vger.kernel.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH v4 0/6] scripts: More Python fixes
Date: Tue, 12 May 2020 12:32:32 +0200
Message-Id: <20200512103238.7078-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 02:02:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 12 May 2020 10:32:46 -0000

Trivial Python3 fixes, again...

Since v3:
- Fixed missing scripts/qemugdb/timers.py (kwolf)
- Cover more scripts
- Check for __main__ in few scripts

Since v2:
- Remove patch updating MAINTAINERS

Since v1:
- Added Alex Bennée A-b tags
- Addressed John Snow review comments
  - Use /usr/bin/env
  - Do not modify os.path (dropped last patch)

Philippe Mathieu-Daudé (6):
  scripts/qemugdb: Remove shebang header
  scripts/qemu-gdb: Use Python 3 interpreter
  scripts/qmp: Use Python 3 interpreter
  scripts/kvm/vmxcap: Use Python 3 interpreter and add pseudo-main()
  scripts/modules/module_block: Use Python 3 interpreter & add
    pseudo-main
  tests/migration/guestperf: Use Python 3 interpreter

 scripts/kvm/vmxcap                 |  7 ++++---
 scripts/modules/module_block.py    | 31 +++++++++++++++---------------
 scripts/qemu-gdb.py                |  4 ++--
 scripts/qemugdb/__init__.py        |  3 +--
 scripts/qemugdb/aio.py             |  3 +--
 scripts/qemugdb/coroutine.py       |  3 +--
 scripts/qemugdb/mtree.py           |  4 +---
 scripts/qemugdb/tcg.py             |  1 -
 scripts/qemugdb/timers.py          |  1 -
 scripts/qmp/qom-get                |  2 +-
 scripts/qmp/qom-list               |  2 +-
 scripts/qmp/qom-set                |  2 +-
 scripts/qmp/qom-tree               |  2 +-
 tests/migration/guestperf-batch.py |  2 +-
 tests/migration/guestperf-plot.py  |  2 +-
 tests/migration/guestperf.py       |  2 +-
 16 files changed, 33 insertions(+), 38 deletions(-)

-- 
2.21.3


