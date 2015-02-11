Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLaPF-0002US-KT
	for mharc-qemu-trivial@gnu.org; Wed, 11 Feb 2015 11:44:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YLaPD-0002RH-Aq
	for qemu-trivial@nongnu.org; Wed, 11 Feb 2015 11:44:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YLaP8-0001L9-Hy
	for qemu-trivial@nongnu.org; Wed, 11 Feb 2015 11:44:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33362)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1YLaP8-0001Kw-Al; Wed, 11 Feb 2015 11:44:46 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1BGiiAf021093
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 11 Feb 2015 11:44:45 -0500
Received: from [10.36.112.44] (ovpn-112-44.ams2.redhat.com [10.36.112.44])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1BGidJL017254
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Wed, 11 Feb 2015 11:44:42 -0500
Message-ID: <54DB86F6.6060005@redhat.com>
Date: Wed, 11 Feb 2015 17:44:38 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <1423673041-13522-1-git-send-email-kraxel@redhat.com>
In-Reply-To: <1423673041-13522-1-git-send-email-kraxel@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] spice: fix memory leak
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
X-List-Received-Date: Wed, 11 Feb 2015 16:44:52 -0000



On 11/02/2015 17:44, Gerd Hoffmann wrote:
> Found by coverity.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  monitor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/monitor.c b/monitor.c
> index c3cc060..29d7e5b 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -1101,6 +1101,7 @@ static int client_migrate_info(Monitor *mon, const QDict *qdict,
>      if (strcmp(protocol, "spice") == 0) {
>          if (!qemu_using_spice(&err)) {
>              qerror_report_err(err);
> +            error_free(local_err);
>              return -1;
>          }
>  
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

