Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fFkNh-0003NR-DW
	for mharc-qemu-trivial@gnu.org; Mon, 07 May 2018 13:57:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fFkNf-0003M8-5p
	for qemu-trivial@nongnu.org; Mon, 07 May 2018 13:57:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fFkNe-0006Hq-Dd
	for qemu-trivial@nongnu.org; Mon, 07 May 2018 13:56:59 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:45470 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1fFkNa-0006A1-0y; Mon, 07 May 2018 13:56:54 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D62881A812F;
	Mon,  7 May 2018 17:56:50 +0000 (UTC)
Received: from [10.10.122.242] (ovpn-122-242.rdu2.redhat.com [10.10.122.242])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 660AE50335;
	Mon,  7 May 2018 17:56:43 +0000 (UTC)
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20180507095539.19584-1-kraxel@redhat.com>
	<20180507095539.19584-2-kraxel@redhat.com>
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, Markus Armbruster <armbru@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <78ec32af-a122-051b-00eb-340836ad7520@redhat.com>
Date: Mon, 7 May 2018 12:56:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180507095539.19584-2-kraxel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 07 May 2018 17:56:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 07 May 2018 17:56:50 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 1/4] ui: add qapi parser
 for -display
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
X-List-Received-Date: Mon, 07 May 2018 17:57:00 -0000

On 05/07/2018 04:55 AM, Gerd Hoffmann wrote:
> Add parse_display_qapi() function which parses the -display command line
> using a qapi visitor for DisplayOptions.  Wire up as default catch in
> parse_display().
> 
> Improves the error message for unknown display types.
> 
> Also enables json as -display argument, i.e. -display "{ 'type': 'gtk' }"
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   vl.c | 24 ++++++++++++++++++++++--
>   1 file changed, 22 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

