Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxIVR-0003ys-Uw
	for mharc-qemu-trivial@gnu.org; Tue, 26 May 2015 13:19:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55940)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YxIVL-0003nW-OL
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 13:19:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YxIVG-0006RA-Mh
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 13:19:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54492)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1YxIVG-0006R6-Az; Tue, 26 May 2015 13:18:58 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t4QHIuxL010869
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 26 May 2015 13:18:56 -0400
Received: from [10.36.112.62] (ovpn-112-62.ams2.redhat.com [10.36.112.62])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4QHIqoi005010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 26 May 2015 13:18:54 -0400
Message-ID: <5564AAFB.2040604@redhat.com>
Date: Tue, 26 May 2015 19:18:51 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
References: <1432622302-6798-1-git-send-email-crosthwaite.peter@gmail.com>	<55642B01.3010305@redhat.com>
	<CAEgOgz6MwXzMG7u_WdMLDDYy1A27eqLTiLvZtKyYXOQSnf2HjQ@mail.gmail.com>
In-Reply-To: <CAEgOgz6MwXzMG7u_WdMLDDYy1A27eqLTiLvZtKyYXOQSnf2HjQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] memory_mapping: Use
	qemu_common.h include
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
X-List-Received-Date: Tue, 26 May 2015 17:19:07 -0000



On 26/05/2015 19:05, Peter Crosthwaite wrote:
> OK, but it is an odd one out, would you be willing to accept
> the double include that seems to be widespread?
> 
> +#include "qemu_common.h"
>  #include "cpu.h"
> -#include "exec/cpu-all.h"

This is exactly what I meant.  What is odd about it?

In fact, including exec/cpu-all.h outside cpu.h is definitely odd.

Paolo

