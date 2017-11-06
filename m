Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eBlWv-0007s9-Uj
	for mharc-qemu-trivial@gnu.org; Mon, 06 Nov 2017 12:49:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eBlWt-0007r3-Ki
	for qemu-trivial@nongnu.org; Mon, 06 Nov 2017 12:49:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eBlWs-0003nJ-Rz
	for qemu-trivial@nongnu.org; Mon, 06 Nov 2017 12:49:47 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:35679)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eBlWn-0003hJ-HU; Mon, 06 Nov 2017 12:49:41 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 699104024C;
	Mon,  6 Nov 2017 20:49:28 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id C6BA2C6E;
	Mon,  6 Nov 2017 20:49:29 +0300 (MSK)
To: "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, amarnath.valluri@intel.com, 
	marcandre.lureau@gmail.com, stefanb@linux.vnet.ibm.com
References: <20171019075031.25507-1-rjones@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <5888e39b-8f55-2d6b-afbe-da4727f23c2d@msgid.tls.msk.ru>
Date: Mon, 6 Nov 2017 20:49:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171019075031.25507-1-rjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] tpm: Don't call tpm_cleanup unless
 CONFIG_TPM.
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
X-List-Received-Date: Mon, 06 Nov 2017 17:49:48 -0000

19.10.2017 10:50, Richard W.M. Jones wrote:
> When compiling with --disable-tpm:
> 
>   ../vl.o: In function `main':
>   /home/rjones/d/qemu/vl.c:4908: undefined reference to `tpm_cleanup'
> 
> This appears to have been introduced in commit c37cacabf228
> ("tpm: Move tpm_cleanup() to right place").
> 

> index 0723835bbf..dbfd06d4bc 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4905,7 +4905,9 @@ int main(int argc, char **argv, char **envp)
>      res_free();
>  
>      /* vhost-user must be cleaned up before chardevs.  */
> +#ifdef CONFIG_TPM
>      tpm_cleanup();
> +#endif

Maybe we can define it to an empty macro (or inline function) in
the header file instead?

/mjt

