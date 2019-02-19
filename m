Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gw9dt-0004ud-Ee
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2019 12:57:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gw9dr-0004sm-C1
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 12:57:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gw9dq-00043t-KI
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 12:57:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:15983)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gw9do-00042l-VE; Tue, 19 Feb 2019 12:57:13 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D2B0EB2D9;
	Tue, 19 Feb 2019 17:57:12 +0000 (UTC)
Received: from [10.3.116.222] (ovpn-116-222.phx2.redhat.com [10.3.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9623C61460;
	Tue, 19 Feb 2019 17:57:11 +0000 (UTC)
To: Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: imammedo@redhat.com, mjt@tls.msk.ru
References: <20190219013106.17538-1-richardw.yang@linux.intel.com>
	<20190219013106.17538-3-richardw.yang@linux.intel.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <2410eba5-4c52-e51e-102b-e77b7a5a2563@redhat.com>
Date: Tue, 19 Feb 2019 11:57:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190219013106.17538-3-richardw.yang@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 19 Feb 2019 17:57:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] CODING_STYLE: indent
 example code as all others
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
X-List-Received-Date: Tue, 19 Feb 2019 17:57:16 -0000

On 2/18/19 7:31 PM, Wei Yang wrote:
> All the example code are indented with four spaces except this one.
> 
> Fix this by adding four spaces here.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> ---
>  CODING_STYLE | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

