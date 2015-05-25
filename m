Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yws75-0007D5-GT
	for mharc-qemu-trivial@gnu.org; Mon, 25 May 2015 09:08:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Yws73-0007Cv-Ca
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 09:08:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Yws6z-0000Gj-4j
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 09:08:13 -0400
Received: from mail-wg0-x235.google.com ([2a00:1450:400c:c00::235]:36495)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Yws6y-0000Gd-TU; Mon, 25 May 2015 09:08:09 -0400
Received: by wgbgq6 with SMTP id gq6so72737036wgb.3;
	Mon, 25 May 2015 06:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=CTitiHdOz4oHQVCpaW4CkGNCgFeL3p7asU94c5OFyCs=;
	b=INGRfrJAvCWwZBPk/0CRoZMChFauaJuo9zVPDstN8bjYsW3oZwVrE9YaxclHC/50Aj
	b0bWMnsiTTGj/Z90liw5fPGHW9tUgMZi6U4k87FW9UnjxX2p6F6AQjemL1XnS6HMKli4
	XSxurVjwkVoeRnT65K15m1J5ohI9/cqKEn0zs/u1xZylYvDRc/wUpAUEEvQPuVStx80O
	E1dr5Svf+W/9Y4uqylXo8U/hjqX4X3oerDY2FJcyjCZ8lUj7UI2zhX+YiBppX8kY2jK9
	6G0Z+7X9OoWyA0lRnI4BJsmMNQrKjkJh6s6pvfiGgMaxfmaDNuhpTm/vaBzQnnrce1+I
	UoVQ==
X-Received: by 10.180.77.195 with SMTP id u3mr21974498wiw.30.1432559288217;
	Mon, 25 May 2015 06:08:08 -0700 (PDT)
Received: from [192.168.10.165] (dynamic-adsl-94-39-199-114.clienti.tiscali.it.
	[94.39.199.114])
	by mx.google.com with ESMTPSA id v3sm11838982wiz.14.2015.05.25.06.08.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 May 2015 06:08:07 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <55631EB5.3000507@redhat.com>
Date: Mon, 25 May 2015 15:08:05 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1432536445-12760-1-git-send-email-zhaoshenglong@huawei.com>
In-Reply-To: <1432536445-12760-1-git-send-email-zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::235
Cc: qemu-trivial@nongnu.org, shannon.zhao@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] vl: fix memory leak spotted by valgrind
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
X-List-Received-Date: Mon, 25 May 2015 13:08:14 -0000



On 25/05/2015 08:47, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> valgrind complains about:
> ==9276== 13 bytes in 1 blocks are definitely lost in loss record 1,046 of 3,673
> ==9276==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
> ==9276==    by 0x2EAFBB: malloc_and_trace (vl.c:2556)
> ==9276==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
> ==9276==    by 0x4A28BD: addr_to_string (vnc.c:123)
> ==9276==    by 0x4A29AD: vnc_socket_local_addr (vnc.c:139)
> ==9276==    by 0x4A9AFE: vnc_display_local_addr (vnc.c:3240)
> ==9276==    by 0x2EF4FE: main (vl.c:4321)
> 
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  vl.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/vl.c b/vl.c
> index 74c2681..9539e7b 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4295,8 +4295,9 @@ int main(int argc, char **argv, char **envp)
>      /* init remote displays */
>      qemu_opts_foreach(qemu_find_opts("vnc"), vnc_init_func, NULL, 0);
>      if (show_vnc_port) {
> -        printf("VNC server running on `%s'\n",
> -               vnc_display_local_addr("default"));
> +        char *ret = vnc_display_local_addr("default");
> +        printf("VNC server running on `%s'\n", ret);
> +        g_free(ret);
>      }
>  #endif
>  #ifdef CONFIG_SPICE
> 

Thanks, queued for 2.4.

