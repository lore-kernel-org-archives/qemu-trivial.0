Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fFkO0-0003a4-3k
	for mharc-qemu-trivial@gnu.org; Mon, 07 May 2018 13:57:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fFkNx-0003Yi-PZ
	for qemu-trivial@nongnu.org; Mon, 07 May 2018 13:57:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fFkNw-0006h8-TT
	for qemu-trivial@nongnu.org; Mon, 07 May 2018 13:57:17 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33232 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1fFkNs-0006bO-IZ; Mon, 07 May 2018 13:57:12 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 110D08D76C;
	Mon,  7 May 2018 17:57:12 +0000 (UTC)
Received: from [10.10.122.242] (ovpn-122-242.rdu2.redhat.com [10.10.122.242])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7A8A4111CA19;
	Mon,  7 May 2018 17:57:09 +0000 (UTC)
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20180507095539.19584-1-kraxel@redhat.com>
	<20180507095539.19584-3-kraxel@redhat.com>
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, Markus Armbruster <armbru@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <8ad7c756-856d-c5aa-8796-7047caa48856@redhat.com>
Date: Mon, 7 May 2018 12:57:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180507095539.19584-3-kraxel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 07 May 2018 17:57:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 07 May 2018 17:57:12 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 2/4] ui: switch trivial
 displays to qapi parser
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
X-List-Received-Date: Mon, 07 May 2018 17:57:18 -0000

On 05/07/2018 04:55 AM, Gerd Hoffmann wrote:
> Drop the option-less display types (egl-headless, curses, none) from
> parse_display(), so they'll be handled by parse_display_qapi().
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   vl.c | 6 ------
>   1 file changed, 6 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

