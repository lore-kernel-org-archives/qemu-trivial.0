Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5KSM-0006zO-Al
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2012 12:15:18 -0500
Received: from eggs.gnu.org ([208.118.235.92]:38434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <avi@redhat.com>) id 1S5KSF-0006hB-RL
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 12:15:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <avi@redhat.com>) id 1S5KSD-0001sa-Vk
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 12:15:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:27462)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <avi@redhat.com>)
	id 1S5KRi-0001iM-Dp; Wed, 07 Mar 2012 12:14:38 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q27HEZOs029369
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 7 Mar 2012 12:14:35 -0500
Received: from balrog.usersys.redhat.com (dhcp-4-82.tlv.redhat.com
	[10.35.4.82])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q27HEXYb025924; Wed, 7 Mar 2012 12:14:33 -0500
Message-ID: <4F579778.5010609@redhat.com>
Date: Wed, 07 Mar 2012 19:14:32 +0200
From: Avi Kivity <avi@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1331122589-15717-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1331122589-15717-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Quote the
 configure args printed in config.log
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
X-List-Received-Date: Wed, 07 Mar 2012 17:15:17 -0000

On 03/07/2012 02:16 PM, Peter Maydell wrote:
> Use the same mechanism we use for printing the configure command
> line to config-host.mak to print it to config.log. This fixes a
> bug where the config.log version didn't quote arguments with spaces.
>  
>  # Print a helpful header at the top of config.log
>  echo "# QEMU configure log $(date)" >> config.log
> -echo "# produced by $0 $*" >> config.log
> +printf "# Configured with:" >> config.log
> +printf " '%s'" "$0" "$@" >> config.log
> +echo >> config.log
>  echo "#" >> config.log
>  

This still breaks if an argument has a single quote.  bash's printf's %q
deals with this correctly, but not sure how portable it is.

-- 
error compiling committee.c: too many arguments to function


