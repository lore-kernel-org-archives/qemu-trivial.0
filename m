Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNiYt-000402-Er
	for mharc-qemu-trivial@gnu.org; Tue, 08 Nov 2011 05:05:47 -0500
Received: from eggs.gnu.org ([140.186.70.92]:53040)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1RNiYq-0003sS-TX
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 05:05:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1RNiYp-0003uW-Dh
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 05:05:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:4892)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1RNiYb-0003s3-Vm; Tue, 08 Nov 2011 05:05:30 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA8A5SkK021517
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 8 Nov 2011 05:05:28 -0500
Received: from redhat.com (vpn1-5-62.ams2.redhat.com [10.36.5.62])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pA8A5N0J028456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Tue, 8 Nov 2011 05:05:26 -0500
Date: Tue, 8 Nov 2011 10:06:02 +0000
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20111108100601.GB15005@redhat.com>
References: <1320746152-31620-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1320746152-31620-1-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ui/vnc: Convert
 sasl.mechlist to g_malloc() & friends
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
X-List-Received-Date: Tue, 08 Nov 2011 10:05:46 -0000

On Tue, Nov 08, 2011 at 10:55:52AM +0100, Markus Armbruster wrote:
> Fixes protocol_client_auth_sasl_mechname() not to crash when malloc()
> fails.  Spotted by Coverity.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  ui/vnc-auth-sasl.c |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/ui/vnc-auth-sasl.c b/ui/vnc-auth-sasl.c
> index 23b1bf5..a88973b 100644
> --- a/ui/vnc-auth-sasl.c
> +++ b/ui/vnc-auth-sasl.c
> @@ -35,7 +35,7 @@ void vnc_sasl_client_cleanup(VncState *vs)
>          vs->sasl.encodedLength = vs->sasl.encodedOffset = 0;
>          vs->sasl.encoded = NULL;
>          g_free(vs->sasl.username);
> -        free(vs->sasl.mechlist);
> +        g_free(vs->sasl.mechlist);
>          vs->sasl.username = vs->sasl.mechlist = NULL;
>          sasl_dispose(&vs->sasl.conn);
>          vs->sasl.conn = NULL;
> @@ -430,7 +430,7 @@ static int protocol_client_auth_sasl_start_len(VncState *vs, uint8_t *data, size
>  
>  static int protocol_client_auth_sasl_mechname(VncState *vs, uint8_t *data, size_t len)
>  {
> -    char *mechname = malloc(len + 1);
> +    char *mechname = g_malloc(len + 1);
>      if (!mechname) {
>          VNC_DEBUG("Out of memory reading mechname\n");
>          vnc_client_error(vs);

You can delete the   if (!mechname) block now you have g_malloc

The reason for the crash on OOM is here, but the diff context doesn't show it:

Notice the missing 'return -1'  statement following vnc_client_error(vs);

    char *mechname = malloc(len + 1);
    if (!mechname) {
        VNC_DEBUG("Out of memory reading mechname\n");
        vnc_client_error(vs);
    }
    strncpy(mechname, (char*)data, len);
    mechname[len] = '\0';



> @@ -460,7 +460,7 @@ static int protocol_client_auth_sasl_mechname(VncState *vs, uint8_t *data, size_
>          }
>      }
>  
> -    free(vs->sasl.mechlist);
> +    g_free(vs->sasl.mechlist);
>      vs->sasl.mechlist = mechname;
>  
>      VNC_DEBUG("Validated mechname '%s'\n", mechname);
> @@ -469,7 +469,7 @@ static int protocol_client_auth_sasl_mechname(VncState *vs, uint8_t *data, size_
>  
>   fail:
>      vnc_client_error(vs);
> -    free(mechname);
> +    g_free(mechname);
>      return -1;
>  }
>  
> @@ -608,7 +608,7 @@ void start_auth_sasl(VncState *vs)
>      }
>      VNC_DEBUG("Available mechanisms for client: '%s'\n", mechlist);
>  
> -    if (!(vs->sasl.mechlist = strdup(mechlist))) {
> +    if (!(vs->sasl.mechlist = g_strdup(mechlist))) {
>          VNC_DEBUG("Out of memory");
>          sasl_dispose(&vs->sasl.conn);
>          vs->sasl.conn = NULL;

Again, you can delete the conditional here with g_strdup

Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://autobuild.org       -o-         http://search.cpan.org/~danberr/ :|
|: http://entangle-photo.org       -o-       http://live.gnome.org/gtk-vnc :|

