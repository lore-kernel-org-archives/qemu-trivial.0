Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h1SlS-0005AE-Hy
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2019 04:23:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1SlP-00055z-0s
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 04:22:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1SlN-0005jU-M7
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 04:22:58 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:41625)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h1SlN-0005io-A2; Wed, 06 Mar 2019 04:22:57 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
	1Mfpf7-1hTdi71WH3-00gFS4; Wed, 06 Mar 2019 10:22:50 +0100
To: Wei Yang <richardw.yang@linux.intel.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: thuth@redhat.com, mst@redhat.com, imammedo@redhat.com, philmd@redhat.com
References: <20190214084939.20640-1-richardw.yang@linux.intel.com>
	<20190214084939.20640-3-richardw.yang@linux.intel.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <058cabac-89cb-c414-4e63-ff3264cf88dc@vivier.eu>
Date: Wed, 6 Mar 2019 10:22:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190214084939.20640-3-richardw.yang@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:x3N0vLl4Fwp6NT8j/X79BkOm/9V86onvc6rf4xaCz8gOBZb5Pp2
	f3aucLXji2E26mnwR0PH2WiVIK0Y/z/bkMRDPP2Ai+e7WuD1O/7GeVCe8RtStzw79FjXu3R
	RvEdXIZwxPHA5Xz2XHpR469mYbcuAozPytFa33p4xOrme6VktXJTZMyuZP0tef0ZVTQgeOA
	W91GMfnoToWako/axKC2g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tUbgskHqbXo=:60ufMVkayKUbzmRKDiVcoF
	xFCCh52c42wTd/jmuIkALdm0VY/hINzvymZ4r6hPvBZeRu57LSra+4OXm7PLZNMoF/iRnMU1e
	RRb6d8sTfNV3Zznd7T2A/N9hPBBk4W42z12IL2Ejfy6e18RvzgE6cBgS252LG1j0hMjbG0xdE
	EHvj3K84I7fFaMZ1pff07+AbN7OKQ+2+RDI5DqzRqi7jd+aAaZk+VAKzJtIPDoothsaO7Eq5p
	7I6ZTHe5KoyQQ0rKHGTRaij5kvNhNPCQpvOP6bLyUeB9bAptMN+CR9iIki6f/LU+jIkex82O+
	5U35YjWkvBSthPvOHIby6S5ksrFjvstyj2/XUmVI388s/1XRvtXhHJn41vnCqY0dBktfb+Tnd
	/xxZJvkwLzJnqUR/ayMGtr52mZKUrRDf28fDcjn2GAyNudOeHhmLZwpCRl4GhN+fMEE82QJwR
	joemfVGVr0gTz5Y/M+jjwl/1VnQ5VcNb9xYeMEeNumNSI0ezhXvlt66p8GE0JhOJKU2Q8m/Rl
	5tAbnLWaL6B6UDI8rZHX2mwNChJ5ayRGW7HpAOAlO9abwHPkCZsMeJm2//NJHbVY/hckLHZq9
	NdI3YMIQ3Un/KiL+jVukr16p/LWFK1Pz1FIRhn67GadOzsxnn+MA5E8LxKilyKh2io2QDA2LW
	DoJkg6nWKPecvXCtNRmVFHv/JjAk91/fy/K3J4gk9+0orMFl67aOZ65XBXF8s/K35vzadJGgb
	7i3phk/z1FrVoapRpDpRrexlXeHghu9/TQSf3DxneJQBdNO0lyIR3RYtpsU=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: Re: [Qemu-trivial] [Patch v4 2/3] hw/acpi: remove unused function
 acpi_table_add_builtin()
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
X-List-Received-Date: Wed, 06 Mar 2019 09:22:59 -0000

On 14/02/2019 09:49, Wei Yang wrote:
> Function acpi_table_add_builtin() is not used anymore.
> 
> Remove the definition and declaration.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/acpi/core.c         | 6 ------
>  include/hw/acpi/acpi.h | 1 -
>  2 files changed, 7 deletions(-)
> 
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index d6f0709691..e9b1a85e54 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -305,12 +305,6 @@ out:
>  
>  static bool acpi_table_builtin = false;
>  
> -void acpi_table_add_builtin(const QemuOpts *opts, Error **errp)
> -{
> -    acpi_table_builtin = true;
> -    acpi_table_add(opts, errp);
> -}
> -
>  unsigned acpi_table_len(void *current)
>  {
>      struct acpi_table_header *hdr = current - sizeof(hdr->_length);
> diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
> index c20ace0d0b..4a8bbaf1b5 100644
> --- a/include/hw/acpi/acpi.h
> +++ b/include/hw/acpi/acpi.h
> @@ -190,7 +190,6 @@ uint8_t *acpi_table_first(void);
>  uint8_t *acpi_table_next(uint8_t *current);
>  unsigned acpi_table_len(void *current);
>  void acpi_table_add(const QemuOpts *opts, Error **errp);
> -void acpi_table_add_builtin(const QemuOpts *opts, Error **errp);
>  
>  typedef struct AcpiSlicOem AcpiSlicOem;
>  struct AcpiSlicOem {
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

