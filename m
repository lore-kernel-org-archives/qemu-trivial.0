Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ezLxE-000816-TK
	for mharc-qemu-trivial@gnu.org; Fri, 23 Mar 2018 08:37:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37889)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ezLxA-0007zj-Tv
	for qemu-trivial@nongnu.org; Fri, 23 Mar 2018 08:37:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ezLx5-0003Qc-Dd
	for qemu-trivial@nongnu.org; Fri, 23 Mar 2018 08:37:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46231)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ezLwr-0003GY-EG; Fri, 23 Mar 2018 08:37:33 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7F9A0413CD;
	Fri, 23 Mar 2018 15:37:24 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 03787D98;
	Fri, 23 Mar 2018 15:37:29 +0300 (MSK)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Alberto Garcia <berto@igalia.com>, 
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Eric Blake <eblake@redhat.com>, Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
	Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Max Reitz <mreitz@redhat.com>, 
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20180322161226.29796-1-lvivier@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <087177af-cc0b-c8b7-ce50-98f1f9cada68@msgid.tls.msk.ru>
Date: Fri, 23 Mar 2018 15:37:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180322161226.29796-1-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH 0/4] coccinelle: re-run scripts from
 scripts/coccinelle
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
X-List-Received-Date: Fri, 23 Mar 2018 12:37:56 -0000

22.03.2018 19:12, Laurent Vivier wrote:
> I've re-run some scripts from the coccinelle directory,
> and they have found some problems.
> 
> This series fixes them.
> 
> Laurent Vivier (4):
>   error: Strip trailing '\n' from error string arguments (again again)
>   error: Remove NULL checks on error_propagate() calls
>   qdict: remove useless cast
>   Remove unnecessary variables for function return value

I've applied patches 1-3, but the 4th patch is a bit.. interesting.
As has already been said, it touches auto-generated files, which is
sort of fine, but it _also_ removes comments, which - I think - is
quite a bit wrong.

I can apply just selected hunks, but.. hmm..

/mjt

