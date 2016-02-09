Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTAoi-0006EI-Bg
	for mharc-qemu-trivial@gnu.org; Tue, 09 Feb 2016 11:07:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1aTAoa-00060X-SI
	for qemu-trivial@nongnu.org; Tue, 09 Feb 2016 11:07:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1aTAoa-0003mQ-2h
	for qemu-trivial@nongnu.org; Tue, 09 Feb 2016 11:06:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47978)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1aTAoV-0003lb-8A; Tue, 09 Feb 2016 11:06:51 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id CEC1D7733C;
	Tue,  9 Feb 2016 16:06:50 +0000 (UTC)
Received: from [10.36.112.25] (ovpn-112-25.ams2.redhat.com [10.36.112.25])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u19G6lKl016514
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 9 Feb 2016 11:06:49 -0500
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <1455027417-32278-1-git-send-email-pbonzini@redhat.com>
	<56BA0DBD.3060206@weilnetz.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56BA0E97.7060002@redhat.com>
Date: Tue, 9 Feb 2016 17:06:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <56BA0DBD.3060206@weilnetz.de>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] w32: include winsock2.h
	before windows.h
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
X-List-Received-Date: Tue, 09 Feb 2016 16:07:03 -0000



On 09/02/2016 17:03, Stefan Weil wrote:
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> 
> Without that patch, windows.h will include winsock.h
> (which conflicts with winsock2.h) when compiling sdl.c.
> 
> Normally we define WIN32_LEAN_AND_MEAN, and
> windows.h won't include winsock.h.
> 
> include/ui/sdl2.h and ui/sdl.c undefine that macro,
> so the order of the include files is important.
> 
> Without testing this, I think that Paolo's patch is needed
> since commit e16f4c8770b73f530dad842a31298963b6c7e41d.
> 

That also explains why only that file complains.  Thanks!

Paolo

