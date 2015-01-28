Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YGUOc-0002Cq-3e
	for mharc-qemu-trivial@gnu.org; Wed, 28 Jan 2015 10:19:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YGUOZ-0002C5-Rd
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 10:19:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YGUOW-0007cZ-Kl
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 10:19:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34297)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1YGUOW-0007cR-Bt; Wed, 28 Jan 2015 10:19:04 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0SFIwCD022327
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 28 Jan 2015 10:18:58 -0500
Received: from [10.36.112.33] (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0SFIt8h020333
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Wed, 28 Jan 2015 10:18:57 -0500
Message-ID: <54C8FDDF.6010300@redhat.com>
Date: Wed, 28 Jan 2015 16:18:55 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-devel <qemu-devel@nongnu.org>
References: <1422457637-45862-1-git-send-email-borntraeger@de.ibm.com>
In-Reply-To: <1422457637-45862-1-git-send-email-borntraeger@de.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcel Apfelbaum <marcel.a@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH/RFC] vl.c: fix memory leak spotted by
	valgrind
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
X-List-Received-Date: Wed, 28 Jan 2015 15:19:08 -0000

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

and Ccing qemu-trivial.  Funny that we do the g_slist_free before exiting!

Paolo

On 28/01/2015 16:07, Christian Borntraeger wrote:
> valgrind complains about:
> ==42062== 16 bytes in 1 blocks are definitely lost in loss record 387 of 1,048
> ==42062==    at 0x402DCB2: malloc (vg_replace_malloc.c:299)
> ==42062==    by 0x40C1BE3: g_malloc (in /usr/lib64/libglib-2.0.so.0.3800.2)
> ==42062==    by 0x40DA133: g_slice_alloc (in /usr/lib64/libglib-2.0.so.0.3800.2)
> ==42062==    by 0x40DB2E5: g_slist_prepend (in /usr/lib64/libglib-2.0.so.0.3800.2)
> ==42062==    by 0x801637FF: object_class_get_list_tramp (object.c:690)
> ==42062==    by 0x40A96C9: g_hash_table_foreach (in /usr/lib64/libglib-2.0.so.0.3800.2)
> ==42062==    by 0x80164885: object_class_foreach (object.c:665)
> ==42062==    by 0x80164975: object_class_get_list (object.c:698)
> ==42062==    by 0x800100A5: machine_parse (vl.c:2447)
> ==42062==    by 0x800100A5: main (vl.c:3756)
> 
> Lets free machines in case of mc.
> 
> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
>  vl.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/vl.c b/vl.c
> index 983259b..9d008ac 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -2450,6 +2450,7 @@ static gint machine_class_cmp(gconstpointer a, gconstpointer b)
>          mc = find_machine(name);
>      }
>      if (mc) {
> +        g_slist_free(machines);
>          return mc;
>      }
>      if (name && !is_help_option(name)) {
> 

