Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkDqi-00022y-Pq
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 11:10:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1XkDq7-0001eT-Sh
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 11:10:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1Xk7zn-0005Yg-5t
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 04:55:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33152)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1Xk7zf-0005On-RB; Fri, 31 Oct 2014 04:55:39 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9V8tbtW027222
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 31 Oct 2014 04:55:37 -0400
Received: from nial.usersys.redhat.com (dhcp-1-126.brq.redhat.com
	[10.34.1.126])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9V8tZXI016627; Fri, 31 Oct 2014 04:55:36 -0400
Date: Fri, 31 Oct 2014 09:55:35 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20141031095535.6df8d574@nial.usersys.redhat.com>
In-Reply-To: <1414696353-23605-1-git-send-email-ehabkost@redhat.com>
References: <1414696353-23605-1-git-send-email-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Andreas =?ISO-8859-1?B?RuRyYmVy?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH] target-i386: Remove unused
	model_features_t struct
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
X-List-Received-Date: Fri, 31 Oct 2014 15:10:46 -0000

On Thu, 30 Oct 2014 17:12:33 -0200
Eduardo Habkost <ehabkost@redhat.com> wrote:

> The struct is not used anymore and can be removed.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  target-i386/cpu.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> index e194601..e4ccee1 100644
> --- a/target-i386/cpu.c
> +++ b/target-i386/cpu.c
> @@ -442,14 +442,6 @@ const char *get_register_name_32(unsigned int reg)
>      return x86_reg_info_32[reg].name;
>  }
>  
> -/* collects per-function cpuid data
> - */
> -typedef struct model_features_t {
> -    uint32_t *guest_feat;
> -    uint32_t *host_feat;
> -    FeatureWord feat_word;
> -} model_features_t;
> -
>  /* KVM-specific features that are automatically added to all CPU models
>   * when KVM is enabled.
>   */

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

