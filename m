Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXQsf-00037i-4r
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 04:28:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1XXQsY-00037R-Pa
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 04:27:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1XXQsT-0007k2-Iv
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 04:27:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:7450)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1XXQsT-0007jZ-Ax; Fri, 26 Sep 2014 04:27:45 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8Q8RXMP015795
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 26 Sep 2014 04:27:34 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-51.ams2.redhat.com
	[10.36.112.51])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8Q8RSJi009231; Fri, 26 Sep 2014 04:27:29 -0400
Message-ID: <54252370.3030707@redhat.com>
Date: Fri, 26 Sep 2014 10:27:28 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
References: <1411719272-9788-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1411719272-9788-1-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, weidong.huang@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, armbru@redhat.com, eblake@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 0/3] os-posix: improve the error message
	printing
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
X-List-Received-Date: Fri, 26 Sep 2014 08:27:55 -0000

Il 26/09/2014 10:14, arei.gonglei@huawei.com ha scritto:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> The patches mainly improve the error message printing.
> And adjust coding style of os-posix.c.
> 
> Daemonize the QEMU process after initialization, QEMU will not detach from
> standard IO until it is ready to receive connections on any of its devices.
> So, using fprintf print error.
> 
> Cc: Eric Blake <eblake@redhat.com>
> 
> Gonglei (3):
>   os-posix: change tab to space avoid violating coding style
>   os-posix: remove confused errno
>   os-posix: report error message when lock file failed
> 
>  os-posix.c | 83 ++++++++++++++++++++++++++++++++++----------------------------
>  1 file changed, 45 insertions(+), 38 deletions(-)
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Michael, are you going to pick these up?

Paolo

