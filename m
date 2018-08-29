Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fv3zJ-0007ax-8q
	for mharc-qemu-trivial@gnu.org; Wed, 29 Aug 2018 13:10:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fv3zH-0007ZV-Bm
	for qemu-trivial@nongnu.org; Wed, 29 Aug 2018 13:10:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fv3zF-0001Uc-CG
	for qemu-trivial@nongnu.org; Wed, 29 Aug 2018 13:10:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47742)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fv3z6-0001RL-JX; Wed, 29 Aug 2018 13:10:24 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com
	[10.5.11.25])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BA3B386665;
	Wed, 29 Aug 2018 17:10:23 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E8F32010D05;
	Wed, 29 Aug 2018 17:10:23 +0000 (UTC)
Date: Wed, 29 Aug 2018 14:10:21 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Chen Zhang <tgfbeta@me.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <20180829171021.GA17213@habkost.net>
References: <23DA939E-B500-4ABE-A484-1FE1CB43B48A@me.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23DA939E-B500-4ABE-A484-1FE1CB43B48A@me.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.25
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 29 Aug 2018 17:10:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] Add support for TCP path/QMP_PATH in
 scripts/qmp/qmp
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
X-List-Received-Date: Wed, 29 Aug 2018 17:10:36 -0000

On Tue, Aug 28, 2018 at 09:32:18PM +0800, Chen Zhang wrote:
> From a1f93198020b8c043edab5292db39b52ac77f78b Mon Sep 17 00:00:00 2001
> 
> Signed-off-by: Zhang Chen <tgfbeta@me.com>
> ---
>  scripts/qmp/qmp | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/qmp/qmp b/scripts/qmp/qmp
> index 6cb46fd..0e8ed19 100755
> --- a/scripts/qmp/qmp
> +++ b/scripts/qmp/qmp
> @@ -63,6 +63,16 @@ def main(args):
>      if not path:
>          print("QMP path isn't set, use --path=qmp-monitor-address or set QMP_PATH")
>          return 1
> +    tcp_addr = path.split(':')
> +    if len(tcp_addr) == 2:
> +        try:
> +            port = int(tcp_addr[1])
> +        except ValueError:
> +            print("QMP path contains a non-numeric TCP port")
> +            return 1
> +        addr = ( tcp_addr[0], port )
> +    else:
> +        addr = path

I don't think this qualifies as trivial patch.

I'm not against extending scripts/qmp/qmp this way, but this
deserves some coordination to allow usage of QMP addresses that
are not unix sockets in other scripts too.  Supporting libvirt's
qemu-monitor-command would be another use case for this.  See:

https://www.mail-archive.com/qemu-block@nongnu.org/msg41351.html

I suggest adding a new option name (e.g. --tcp) to explicitly
tell the script you have a hostname:port pair, for simplicity.
It doesn't make sense to overload an option named "path" for
something that is not a path.


>  
>      if len(args):
>          command, args = args[0], args[1:]
> @@ -74,7 +84,7 @@ def main(args):
>      if command in ['help']:
>          os.execlp('man', 'man', 'qmp')
>  
> -    srv = QEMUMonitorProtocol(path)
> +    srv = QEMUMonitorProtocol(addr)
>      srv.connect()
>  
>      def do_command(srv, cmd, **kwds):
> @@ -99,7 +109,7 @@ def main(args):
>              raise
>          return 0
>  
> -    srv = QEMUMonitorProtocol(path)
> +    srv = QEMUMonitorProtocol(addr)
>      srv.connect()
>  
>      arguments = {}
> -- 
> 2.7.4
> 

-- 
Eduardo

