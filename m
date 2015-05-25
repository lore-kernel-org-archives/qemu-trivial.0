Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ywstd-00048R-8k
	for mharc-qemu-trivial@gnu.org; Mon, 25 May 2015 09:58:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48862)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1YwstX-00041L-2P
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 09:58:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1YwstT-00066j-Aa
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 09:58:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35104)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1YwstL-00065Z-6E; Mon, 25 May 2015 09:58:07 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t4PDvn7H028539
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 25 May 2015 09:57:49 -0400
Received: from nial.brq.redhat.com (nial.brq.redhat.com [10.34.26.56])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4PDvlro032692; Mon, 25 May 2015 09:57:47 -0400
Date: Mon, 25 May 2015 15:57:46 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20150525155746.042a41c7@nial.brq.redhat.com>
In-Reply-To: <1432543077-12656-4-git-send-email-zhaoshenglong@huawei.com>
References: <1432543077-12656-1-git-send-email-zhaoshenglong@huawei.com>
	<1432543077-12656-4-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, shannon.zhao@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/3] hw/i386/acpi-build:
	decref after use
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
X-List-Received-Date: Mon, 25 May 2015 13:58:23 -0000

On Mon, 25 May 2015 16:37:57 +0800
Shannon Zhao <zhaoshenglong@huawei.com> wrote:

> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> valgrind complains about:
> ==16447== 48 bytes in 2 blocks are definitely lost in loss record 2,033 of 3,310
> ==16447==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
> ==16447==    by 0x2E4FD7: malloc_and_trace (vl.c:2546)
> ==16447==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
> ==16447==    by 0x53EC3F: qint_from_int (qint.c:33)
> ==16447==    by 0x53B426: qmp_output_type_int (qmp-output-visitor.c:162)
> ==16447==    by 0x539257: visit_type_uint32 (qapi-visit-core.c:147)
> ==16447==    by 0x471D07: property_get_uint32_ptr (object.c:1651)
> ==16447==    by 0x47000C: object_property_get (object.c:822)
> ==16447==    by 0x472428: object_property_get_qobject (qom-qobject.c:37)
> ==16447==    by 0x25701A: build_append_pci_bus_devices (acpi-build.c:520)
> ==16447==    by 0x25902E: build_ssdt (acpi-build.c:1004)
> ==16447==    by 0x25A0A8: acpi_build (acpi-build.c:1420)
> 
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/acpi-build.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index d0a5c85..1b566c9 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -648,6 +648,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>          }
>      }
>      aml_append(parent_scope, method);
> +    qobject_decref(bsel);
>  }
>  
>  static void


