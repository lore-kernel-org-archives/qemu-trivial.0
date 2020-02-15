Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j307Q-0002tA-Q8
	for mharc-qemu-trivial@gnu.org; Sat, 15 Feb 2020 11:16:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47757)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j307O-0002pU-Ci
 for qemu-trivial@nongnu.org; Sat, 15 Feb 2020 11:16:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j307N-00064m-CE
 for qemu-trivial@nongnu.org; Sat, 15 Feb 2020 11:16:34 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39790
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j306u-0005Xr-Jo
 for qemu-trivial@nongnu.org; Sat, 15 Feb 2020 11:16:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581783363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rGxu2WAKHmWrsK5i7B1ITlPmz0WbEXAEhhFZo5Btr6I=;
 b=FUcDHnBDwXhqSHy5iRUT2w581OdwVUJeTpcdqsuQu1uiTImmfoxbplPawllaseidW5hdak
 u/wbnvnKJEqErpRPbx8iVIjiiWDxV/WZFax08EbSuN2dJ6BBJYdzCsrTDlGGsRdRdSS7Bv
 Kzv00aGc471fTCxJXIkmML3MpkV6ZpE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-Q9u1NRuGNDSu95UFFah2bA-1; Sat, 15 Feb 2020 11:16:01 -0500
Received: by mail-wr1-f71.google.com with SMTP id t6so5950477wru.3
 for <qemu-trivial@nongnu.org>; Sat, 15 Feb 2020 08:16:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I8Qt4eqntsRD4P75qFlC97N/QHEJ2WA+14+XeTDgAcQ=;
 b=bZrYoM1VsIcuOyZzzXn8b0+GhgKgjP6SdvcTe0Td7siShc+9HLb5mIMsVkD8qJkDjR
 mvG5Cp7vyY4N3hwW7tS8tarF2+HX1s4fdM89AD2PrRrD+FdDpOWa1eXVy/c9Lyv1O2PC
 p1vO+jSFR5KHc/ccZQNMfMba9UQ+ce4//pkAY9yxh4/d3IFneYFUsFKhVeCTPRPw3cMW
 Q65dKZKXucliuAo0yRQBXBrMpagWHd5dTDRooCsGVnFgPBWhlTcNPwSn7wTbs1tiy+nw
 DM/EmrKbkQdRxJXrfmNSxOOaKLsgcdkRmwSpsjbYsfRXckVv98VgB525GIeAbD4atzL5
 /ZuA==
X-Gm-Message-State: APjAAAWKAlWosFiGDsZWXJhEFsAqwdTn7cgreEsLyq4+y0h25e/xNXdY
 cdF2GXXY8QEyFpsj6gP13th//fwYsOZiC/e5B/n8erg7eSbkZFiajn1BuXna95XNrLIRf9Dgu9G
 FXt3WapmMT7AhGRFoDg==
X-Received: by 2002:a7b:c38c:: with SMTP id s12mr11241100wmj.96.1581783360549; 
 Sat, 15 Feb 2020 08:16:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqwR7Jcu6Rjjh6mJ2IoDSuorj+uiRsbXaSzmeAatmVqX2SdSszjnTOrDW8nSYrMCF94WHKpAfw==
X-Received: by 2002:a7b:c38c:: with SMTP id s12mr11241086wmj.96.1581783360302; 
 Sat, 15 Feb 2020 08:16:00 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id w26sm11855872wmi.8.2020.02.15.08.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2020 08:15:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 0/3] hw: Remove unneeded variable assignment
Date: Sat, 15 Feb 2020 17:15:54 +0100
Message-Id: <20200215161557.4077-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-MC-Unique: Q9u1NRuGNDSu95UFFah2bA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Sat, 15 Feb 2020 16:16:35 -0000

Fix few warnings reported by Clang static code analyzer.

Philippe Mathieu-Daud=C3=A9 (3):
  block/qcow2-bitmap: Remove unneeded variable assignment
  hw/display/qxl: Remove unneeded variable assignment
  hw/block/pflash_cfi02: Remove unneeded variable assignment

 block/qcow2-bitmap.c    | 1 -
 hw/block/pflash_cfi02.c | 1 -
 hw/display/qxl.c        | 2 +-
 3 files changed, 1 insertion(+), 3 deletions(-)

--=20
2.21.1


