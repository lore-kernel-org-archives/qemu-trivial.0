Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gole6-00064W-1R
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 03:54:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1gole4-00063k-F8
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 03:54:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1gole3-00069l-Nd
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 03:54:56 -0500
Received: from mga05.intel.com ([192.55.52.43]:10998)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1gole0-00067c-IT; Wed, 30 Jan 2019 03:54:52 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jan 2019 00:54:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,540,1539673200"; d="scan'208";a="130075414"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.37])
	by orsmga002.jf.intel.com with ESMTP; 30 Jan 2019 00:54:48 -0800
Date: Wed, 30 Jan 2019 16:54:19 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, mst@redhat.com
Message-ID: <20190130085419.GA10043@richard>
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
References: <20190130030207.6770-1-richardw.yang@linux.intel.com>
	<20190130091650.5c7b5f7e@Igors-MacBook-Pro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190130091650.5c7b5f7e@Igors-MacBook-Pro.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.43
Subject: Re: [Qemu-trivial] [PATCH] i386,
 acpi: cleanup build_facs by removing second unused argument
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
X-List-Received-Date: Wed, 30 Jan 2019 08:54:57 -0000

On Wed, Jan 30, 2019 at 09:16:50AM +0100, Igor Mammedov wrote:
>On Wed, 30 Jan 2019 11:02:07 +0800
>Wei Yang <richardw.yang@linux.intel.com> wrote:
>
>> The second argument of build_facs() is not used, just remove it.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>
>Reviewed-by: Igor Mammedov <imammedo@redhat.com>

Thanks :-)

>
>> ---
>>  hw/i386/acpi-build.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index 236a20eaa8..023729c1f2 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -292,7 +292,7 @@ static void acpi_align_size(GArray *blob, unsigned align)
>>  
>>  /* FACS */
>>  static void
>> -build_facs(GArray *table_data, BIOSLinker *linker)
>> +build_facs(GArray *table_data)
>>  {
>>      AcpiFacsDescriptorRev1 *facs = acpi_data_push(table_data, sizeof *facs);
>>      memcpy(&facs->signature, "FACS", 4);
>> @@ -2643,7 +2643,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>>       * requirements.
>>       */
>>      facs = tables_blob->len;
>> -    build_facs(tables_blob, tables->linker);
>> +    build_facs(tables_blob);
>>  
>>      /* DSDT is pointed to by FADT */
>>      dsdt = tables_blob->len;

-- 
Wei Yang
Help you, Help me

