Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eEXwY-00021E-6D
	for mharc-qemu-trivial@gnu.org; Tue, 14 Nov 2017 04:55:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1eEXwV-0001zh-PP
	for qemu-trivial@nongnu.org; Tue, 14 Nov 2017 04:55:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1eEXwU-0005PT-J6
	for qemu-trivial@nongnu.org; Tue, 14 Nov 2017 04:55:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36908)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1eEXwP-0005Kd-Cu; Tue, 14 Nov 2017 04:55:37 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 743F4C01F290;
	Tue, 14 Nov 2017 09:55:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-18.ams2.redhat.com
	[10.36.116.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3421C89F3C;
	Tue, 14 Nov 2017 09:55:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 70433A1F4; Tue, 14 Nov 2017 10:55:35 +0100 (CET)
Date: Tue, 14 Nov 2017 10:55:35 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, alistair23@gmail.com,
	armbru@redhat.com
Message-ID: <20171114095535.52dn7x5f4nsz3j2u@sirius.home.kraxel.org>
References: <cover.1510612380.git.alistair.francis@xilinx.com>
	<1743d21d4c073ae4f8aabada57692bd2e536aa8e.1510612380.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1743d21d4c073ae4f8aabada57692bd2e536aa8e.1510612380.git.alistair.francis@xilinx.com>
User-Agent: NeoMutt/20171027
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 14 Nov 2017 09:55:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v5 01/29] audio: Replace AUDIO_FUNC with
 __func__
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
X-List-Received-Date: Tue, 14 Nov 2017 09:55:44 -0000

On Mon, Nov 13, 2017 at 02:34:39PM -0800, Alistair Francis wrote:
> Apparently we don't use __MSC_VER as a compiler anymore and we always
> require a C99 compiler (which means we always have __func__) so we don't
> need a special AUDIO_FUNC macro. We can just replace AUDIO_FUNC with
> __func__ instead.
> 
> Checkpatch failures were manually fixed.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


