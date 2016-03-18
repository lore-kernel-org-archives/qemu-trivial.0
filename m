Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1agzEM-0002As-AX
	for mharc-qemu-trivial@gnu.org; Fri, 18 Mar 2016 14:34:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1agzEK-00027P-B0
	for qemu-trivial@nongnu.org; Fri, 18 Mar 2016 14:34:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1agzEJ-0006VP-GE
	for qemu-trivial@nongnu.org; Fri, 18 Mar 2016 14:34:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58110)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1agzEF-0006TU-KM; Fri, 18 Mar 2016 14:34:31 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 2F6882F1462;
	Fri, 18 Mar 2016 18:34:31 +0000 (UTC)
Received: from work-vm (ovpn-116-86.ams2.redhat.com [10.36.116.86])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2IIYSUh012556
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 18 Mar 2016 14:34:30 -0400
Date: Fri, 18 Mar 2016 18:34:27 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: pbonzini@redhat.com, qemu-trivial@nongnu.org
Message-ID: <20160318183427.GM2246@work-vm>
References: <1452599928-7471-1-git-send-email-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452599928-7471-1-git-send-email-dgilbert@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] config.status: Pass extra
	parameters
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
X-List-Received-Date: Fri, 18 Mar 2016 18:34:37 -0000

Can someone pick this tiny patch up that I sent in January:

(adding in qemu-trivial)

Dave

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> This allows you to do:
>   ./config.status --the-option-you-forgot
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 44ac9ab..9a9e978 100755
> --- a/configure
> +++ b/configure
> @@ -5954,7 +5954,7 @@ cat <<EOD >config.status
>  EOD
>  printf "exec" >>config.status
>  printf " '%s'" "$0" "$@" >>config.status
> -echo >>config.status
> +echo ' "$@"' >>config.status
>  chmod +x config.status
>  
>  rm -r "$TMPDIR1"
> -- 
> 2.5.0
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

