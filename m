Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goGrO-0000wb-Ir
	for mharc-qemu-trivial@gnu.org; Mon, 28 Jan 2019 19:02:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1goGrM-0000wM-Tn
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2019 19:02:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1goGrL-0005hA-L7
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2019 19:02:36 -0500
Received: from mga07.intel.com ([134.134.136.100]:23324)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1goGrK-0005ZY-WA; Mon, 28 Jan 2019 19:02:35 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Jan 2019 16:02:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,535,1539673200"; d="scan'208";a="270657498"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.37])
	by orsmga004.jf.intel.com with ESMTP; 28 Jan 2019 16:02:26 -0800
Date: Tue, 29 Jan 2019 08:01:57 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, laurent@vivier.eu, mst@redhat.com
Message-ID: <20190129000157.GA30562@richard>
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
References: <20190125060157.29935-1-richardw.yang@linux.intel.com>
	<20190128143230.3bda74a0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190128143230.3bda74a0@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.100
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/3] hw/i386/pc.c: remove
 unused function pc_acpi_init()
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
X-List-Received-Date: Tue, 29 Jan 2019 00:02:37 -0000

On Mon, Jan 28, 2019 at 02:32:30PM +0100, Igor Mammedov wrote:
>On Fri, 25 Jan 2019 14:01:55 +0800
>Wei Yang <richardw.yang@linux.intel.com> wrote:
>
>> Function pc_acpi_init() is now used in no place.
>s/is now used in no place./in not used anymore,/
>
>fixup the same phrase in other patches.
>
>otherwise series looks good, so fix commit messages and resubmit series.
>
>Also when sending  multi-patch series, pls use cover letter
>(see help for git format-patch --cover-letter)

Thanks :-)

Will change and re-submit.

>
> 
>> Remove the definition and declaration.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> ---
>>  hw/i386/pc.c         | 27 ---------------------------
>>  include/hw/i386/pc.h |  1 -
>>  2 files changed, 28 deletions(-)
>> 
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 5317e08f60..734d3268fa 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -1280,33 +1280,6 @@ void pc_pci_as_mapping_init(Object *owner, MemoryRegion *system_memory,
>>                                          pci_address_space, -1);
>>  }
>>  
>> -void pc_acpi_init(const char *default_dsdt)
>> -{
>> -    char *filename;
>> -
>> -    if (acpi_tables != NULL) {
>> -        /* manually set via -acpitable, leave it alone */
>> -        return;
>> -    }
>> -
>> -    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, default_dsdt);
>> -    if (filename == NULL) {
>> -        warn_report("failed to find %s", default_dsdt);
>> -    } else {
>> -        QemuOpts *opts = qemu_opts_create(qemu_find_opts("acpi"), NULL, 0,
>> -                                          &error_abort);
>> -        Error *err = NULL;
>> -
>> -        qemu_opt_set(opts, "file", filename, &error_abort);
>> -
>> -        acpi_table_add_builtin(opts, &err);
>> -        if (err) {
>> -            warn_reportf_err(err, "failed to load %s: ", filename);
>> -        }
>> -        g_free(filename);
>> -    }
>> -}
>> -
>>  void xen_load_linux(PCMachineState *pcms)
>>  {
>>      int i;
>> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
>> index 9d29c4b1df..541124ba6d 100644
>> --- a/include/hw/i386/pc.h
>> +++ b/include/hw/i386/pc.h
>> @@ -187,7 +187,6 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level);
>>  
>>  void pc_cpus_init(PCMachineState *pcms);
>>  void pc_hot_add_cpu(const int64_t id, Error **errp);
>> -void pc_acpi_init(const char *default_dsdt);
>>  
>>  void pc_guest_info_init(PCMachineState *pcms);
>>  

-- 
Wei Yang
Help you, Help me

