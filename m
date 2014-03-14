Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOTJt-0007Ll-9Y
	for mharc-qemu-trivial@gnu.org; Fri, 14 Mar 2014 10:42:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1WOTJk-0007LT-5I
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 10:42:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1WOTJe-00083m-6A
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 10:42:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45235)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>)
	id 1WOTJd-00083h-Sn; Fri, 14 Mar 2014 10:42:30 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2EEgIPB027402
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 14 Mar 2014 10:42:23 -0400
Received: from colepc.home (ovpn-113-49.phx2.redhat.com [10.3.113.49])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2EEgHmR020944; Fri, 14 Mar 2014 10:42:17 -0400
Message-ID: <53231549.3090606@redhat.com>
Date: Fri, 14 Mar 2014 10:42:17 -0400
From: Cole Robinson <crobinso@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Laszlo Ersek <lersek@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <1394807976-9469-1-git-send-email-lersek@redhat.com>
	<1394807976-9469-2-git-send-email-lersek@redhat.com>
In-Reply-To: <1394807976-9469-2-git-send-email-lersek@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [trivial PATCH 2.0 1/1] sasl: Avoid 'Could not
 find keytab file' in syslog
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
X-List-Received-Date: Fri, 14 Mar 2014 14:42:42 -0000

On 03/14/2014 10:39 AM, Laszlo Ersek wrote:
> The "keytab" specification in "qemu.sasl" only makes sense if "gssapi" is
> selected in "mech_list". Even if the latter is not done (ie. "gssapi" is
> not selected), the cyrus-sasl library tries to open the specified keytab
> file, although nothing has a use for it outside the gssapi backend.
> 
> Since the default keytab file "/etc/qemu/krb5.tab" is usually absent, the
> cyrus-sasl library emits a warning to syslog at startup, which tends to
> annoy users (who didn't ask for gssapi in the first place).
> 
> Comment out the keytab specification per default.
> 
> "qemu-doc.texi" already correctly explains how to use "mech_list: gssapi"
> together with "keytab:".
> 
> See also:
> - upstream libvirt commit fe772f24,
> - Red Hat Bugzilla <https://bugzilla.redhat.com/show_bug.cgi?id=1018434>.
> 
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> ---
>  qemu.sasl | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/qemu.sasl b/qemu.sasl
> index 9dc8323..64fdef3 100644
> --- a/qemu.sasl
> +++ b/qemu.sasl
> @@ -22,7 +22,9 @@ mech_list: digest-md5
>  # Some older builds of MIT kerberos on Linux ignore this option &
>  # instead need KRB5_KTNAME env var.
>  # For modern Linux, and other OS, this should be sufficient
> -keytab: /etc/qemu/krb5.tab
> +#
> +# There is no default value here, uncomment if you need this
> +#keytab: /etc/qemu/krb5.tab
>  
>  # If using digest-md5 for username/passwds, then this is the file
>  # containing the passwds. Use 'saslpasswd2 -a qemu [username]'
> 

ACK, libvirt has carried a similar change in their sasl config for a while now.

- Cole

