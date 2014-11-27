Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XtyUb-0007Tp-6n
	for mharc-qemu-trivial@gnu.org; Thu, 27 Nov 2014 07:48:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XtyUU-0007Ly-Eg
	for qemu-trivial@nongnu.org; Thu, 27 Nov 2014 07:48:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XtyUP-000418-FE
	for qemu-trivial@nongnu.org; Thu, 27 Nov 2014 07:48:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59416)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XtyUE-0003yp-CE; Thu, 27 Nov 2014 07:47:54 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sARClfBS029125
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 27 Nov 2014 07:47:42 -0500
Received: from blackfin.pond.sub.org (ovpn-116-65.ams2.redhat.com
	[10.36.116.65])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sARClddn006643
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 27 Nov 2014 07:47:40 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id DF7D2303FEB1; Thu, 27 Nov 2014 13:47:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: <arei.gonglei@huawei.com>
References: <1415881027-8112-1-git-send-email-arei.gonglei@huawei.com>
	<1415881027-8112-3-git-send-email-arei.gonglei@huawei.com>
Date: Thu, 27 Nov 2014 13:47:38 +0100
In-Reply-To: <1415881027-8112-3-git-send-email-arei.gonglei@huawei.com> (arei
	gonglei's message of "Thu, 13 Nov 2014 20:17:07 +0800")
Message-ID: <87h9xkkdxx.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	aneesh.kumar@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] virtfs-proxy-helper:
	Fix handle leak to make Coverity happy
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
X-List-Received-Date: Thu, 27 Nov 2014 12:48:15 -0000

<arei.gonglei@huawei.com> writes:

> From: Gonglei <arei.gonglei@huawei.com>
>
> Coverity report:
> (94) Event open_fn:  Returning handle opened by function "proxy_socket(char const *, uid_t, gid_t)". [details]
> (95) Event var_assign:  Assigning: "sock" = handle returned from "proxy_socket(sock_name, own_u, own_g)".
> (103) Event leaked_handle:  Handle variable "sock" going out of scope leaks the handle.
>
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  fsdev/virtfs-proxy-helper.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
> index c1da2d7..2d72def 100644
> --- a/fsdev/virtfs-proxy-helper.c
> +++ b/fsdev/virtfs-proxy-helper.c
> @@ -1150,6 +1150,9 @@ int main(int argc, char **argv)
>  
>      process_requests(sock);
>  error:
> +    if (sock_name && sock >= 0) {
> +        close(sock);
> +    }
>      do_log(LOG_INFO, "Done\n");
>      closelog();
>      return 0;

Why if sock_name?  What about sock gotten from -f?

If sock >= 0 is pointless, too, but needed to hush up Coverity.

