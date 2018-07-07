Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fbnV4-00082E-S8
	for mharc-qemu-trivial@gnu.org; Sat, 07 Jul 2018 09:43:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hqm03ster@gmail.com>) id 1fbjnM-0002nm-8w
	for qemu-trivial@nongnu.org; Sat, 07 Jul 2018 05:46:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hqm03ster@gmail.com>) id 1fbjnF-0004d8-Vm
	for qemu-trivial@nongnu.org; Sat, 07 Jul 2018 05:46:24 -0400
Received: from mail-pl0-x230.google.com ([2607:f8b0:400e:c01::230]:45760)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hqm03ster@gmail.com>) id 1fbjnF-0004cL-Os
	for qemu-trivial@nongnu.org; Sat, 07 Jul 2018 05:46:17 -0400
Received: by mail-pl0-x230.google.com with SMTP id bi1-v6so3930655plb.12
	for <qemu-trivial@nongnu.org>; Sat, 07 Jul 2018 02:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=XZ1JbLuC4NEAa7OddZGkte0dGenSZMiEFifT8MpJXFI=;
	b=scde7lwP4nKGLnN1COOsrqd5uDQoi6O2uuIVKeHyAIDyraf5CggGLyIZGOKQhT/hXN
	fCRZG3eWBy0NQqlKo96ycuXT8Axv1B+FE7Q+PtijDijSCgwTmklWB+dcVny1RmlXyehM
	iGEpBl/P+5fqDYzsWcLZ+3sSz1cHrxnqJPZotjeKPtqxobirB+qJLH93jGb72Z9WyGTS
	Mdo1LN3W+W4qLbMvCtz4dkEYMRWi3QlADWcI0M39gvh0adnYDxW1PlW5PED4dYNtgRIg
	BeLxzIMdYtHXrxyLxndRKWKWHaQgvl9bIjL7GRwA9xKSe3jlF6NXKRhT9i0sCkkFikDF
	/6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XZ1JbLuC4NEAa7OddZGkte0dGenSZMiEFifT8MpJXFI=;
	b=soY9KMXE6HxtpTyd3RJ1DRT3ExNxMjMCh+SKD9kU3PndNOuCl+8r2LNjdJ5wSBvYQP
	jGSWSlqBzxxPv+sh4r/ndpZnnh/rliI68HUpYZcCIBqRnVPe3/EkJxaRsvvuxmuLx6RV
	StZMCHGtFSdn5m9cS+qbh9jZiUZKUnh4+eVqS6oPVMM2tsDvT9M8nI7/pc4xpkvCKUR6
	56ZDeXHhKatmOjCEFqCaXz3D5uztHWGmKjDFOqbKGhFMDmD1gh3tUg51KKqLvyWYGysv
	35D1N58Gp3t4Itzd3+wtoVruLKklIsEwvIFwbqxkO9ypMk9WaHkAUHPPJ7Rwujk1isYL
	Pfgw==
X-Gm-Message-State: APt69E2cDaaisPgfljvxwqz+cYSp1BewqZiq3p1jZj+51Bd5/gSXR4mL
	VqQE0/ih5EyFD236w++Qz/s=
X-Google-Smtp-Source: AAOMgpfU3cSSNJi4i0X2czGYSV3FYbAukMSk7OBjxaoj+Xin7/+hNslbqLgYT8bOsEDsmwXI6BKxhg==
X-Received: by 2002:a17:902:9a95:: with SMTP id
	w21-v6mr13379536plp.168.1530956776313; 
	Sat, 07 Jul 2018 02:46:16 -0700 (PDT)
Received: from localhost.localdomain ([45.58.38.15])
	by smtp.gmail.com with ESMTPSA id
	v15-v6sm16006421pff.120.2018.07.07.02.46.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Jul 2018 02:46:15 -0700 (PDT)
From: Qiming HOU <hqm03ster@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-trivial@nongnu.org,
	Qiming HOU <hqm03ster@gmail.com>
Date: Sat,  7 Jul 2018 17:45:26 +0800
Message-Id: <20180707094527.8248-1-hqm03ster@gmail.com>
X-Mailer: git-send-email 2.17.1.windows.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::230
X-Mailman-Approved-At: Sat, 07 Jul 2018 09:43:45 -0400
Subject: [Qemu-trivial] [PATCH 0/1] Fixed mouse cursor location for scaled
 dmabuf
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
X-List-Received-Date: Sat, 07 Jul 2018 09:46:25 -0000

When a GVT-g virtual machine using dmabuf has its display output
scaled by the gtk UI, its mouse cursor is positioned incorrectly.

This patch fixes that.

Qiming HOU (1):
  hw/gtk-egl: fixed dmabuf cursor location when the main buffer is
    scaled

 ui/gtk-egl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.17.1.windows.2


