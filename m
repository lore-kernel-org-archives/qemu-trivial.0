Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YNH3E-0007k5-3e
	for mharc-qemu-trivial@gnu.org; Mon, 16 Feb 2015 03:29:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48550)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YNH3B-0007fq-Ov
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 03:29:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YNH38-0000nA-Jl
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 03:29:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56901)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1YNH31-0000jF-Gt; Mon, 16 Feb 2015 03:28:55 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1G8SqLG006026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 16 Feb 2015 03:28:52 -0500
Received: from [10.36.116.55] (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1G8Sna9003754; Mon, 16 Feb 2015 03:28:50 -0500
Message-ID: <1424075329.3722.0.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: arei.gonglei@huawei.com
Date: Mon, 16 Feb 2015 09:28:49 +0100
In-Reply-To: <1424059258-11024-3-git-send-email-arei.gonglei@huawei.com>
References: <1424059258-11024-1-git-send-email-arei.gonglei@huawei.com>
	<1424059258-11024-3-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Wang Xin <wangxinxin.wang@huawei.com>,
	mjt@tls.msk.ru, qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH 2/2] qemu-char: add cyrillic key
 'numerosign' to Russian keymap
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
X-List-Received-Date: Mon, 16 Feb 2015 08:29:06 -0000

> 'numerosign' is the numbersign key of Russian keyboard layout, we
> get this key with press 'shift + 3'. It's missing in current
> Russian keymap file, this patch fix it.


>  quotedbl 0x03 shift altgr
>  numbersign 0x04 shift

Looks like this line should be removed.

> +numerosign 0x04 shift
>  dollar 0x05 shift

cheers,
  Gerd



