Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YuiKe-0001C7-8V
	for mharc-qemu-trivial@gnu.org; Tue, 19 May 2015 10:17:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1YuiKW-00010q-FG
	for qemu-trivial@nongnu.org; Tue, 19 May 2015 10:17:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1YuiKS-0007jg-AZ
	for qemu-trivial@nongnu.org; Tue, 19 May 2015 10:17:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54098)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1YuiKI-0007ZD-B6; Tue, 19 May 2015 10:16:58 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t4JEGumT027876
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 19 May 2015 10:16:56 -0400
Received: from redhat.com (vpn1-4-221.ams2.redhat.com [10.36.4.221])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4JEGpP4001197
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 19 May 2015 10:16:54 -0400
Date: Tue, 19 May 2015 15:16:51 +0100
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Martin Cerveny <M.Cerveny@computer.org>
Message-ID: <20150519141651.GA8535@redhat.com>
References: <1431519294-8873-1-git-send-email-M.Cerveny@computer.org>
	<1431519294-8873-2-git-send-email-M.Cerveny@computer.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1431519294-8873-2-git-send-email-M.Cerveny@computer.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] scripts: qom-*: add
	network syntax
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 May 2015 14:17:18 -0000

On Wed, May 13, 2015 at 02:14:53PM +0200, Martin Cerveny wrote:
> Add network syntax parsing (ip address, port) to qom-* scripts.
> 
> Signed-off-by: Martin Cerveny <M.Cerveny@computer.org>
> ---
>  scripts/qmp/qom-fuse |   13 ++++++++++++-
>  scripts/qmp/qom-get  |   12 +++++++++++-
>  scripts/qmp/qom-list |   12 +++++++++++-
>  scripts/qmp/qom-set  |   12 +++++++++++-
>  scripts/qmp/qom-tree |   12 +++++++++++-
>  5 files changed, 56 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/qmp/qom-fuse b/scripts/qmp/qom-fuse
> index 5c6754a..d49f36d 100755
> --- a/scripts/qmp/qom-fuse
> +++ b/scripts/qmp/qom-fuse
> @@ -134,5 +134,16 @@ class QOMFS(Fuse):
>  if __name__ == '__main__':
>      import sys, os
>  
> -    fs = QOMFS(QEMUMonitorProtocol(os.environ['QMP_SOCKET']))
> +    socket_path = os.environ['QMP_SOCKET']
> +    connection = socket_path.split(':')
> +    if len(connection) == 2:
> +        try:
> +            port = int(connection[1])
> +        except ValueError:
> +            raise QMPBadPort
> +        connection = ( connection[0], port )
> +    else:
> +        connection = socket_path
> +
> +    fs = QOMFS(QEMUMonitorProtocol(connection))
>      fs.main(sys.argv)

Rather than duplicate this code in every single command line tool
I think it'd be better to add a static method to QEMUMonitorProtocol
eg

  @staticmethod
  def from_address_string(addr_string):
       connection = socket_path.split(':')
       if len(connection) == 2:
           try:
               port = int(connection[1])
           except ValueError:
               raise QMPBadPort
           connection = ( connection[0], port )
       else:
           connection = addr_string

       return QEMUMonitorProtocol(connection)

Then each script can just do

   srv = QEMUMonitorProtocol.from_address_string(
       os.environ['QMP_SOCKET'])


Really the from_address_string should check for None eg

   if addr_string is None:
      print >>sys.stderr "Address string is required"
      sys.exit(1)

And as Eric says, splitting on ':' doesn't work with
IPv6

Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://autobuild.org       -o-         http://search.cpan.org/~danberr/ :|
|: http://entangle-photo.org       -o-       http://live.gnome.org/gtk-vnc :|

