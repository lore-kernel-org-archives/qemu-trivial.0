Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQUKi-00026g-TU
	for mharc-qemu-trivial@gnu.org; Wed, 15 Sep 2021 08:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQUKi-00026U-8Z; Wed, 15 Sep 2021 08:48:12 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:57407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQUKg-0004JA-Dq; Wed, 15 Sep 2021 08:48:12 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MyKYE-1mpapj2a1U-00yhCj; Wed, 15 Sep 2021 14:48:03 +0200
Subject: Re: [PATCH v2] hw/i386/acpi-build: Fix a typo
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
References: <20210911082036.436139-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <420999a6-dfa5-a4e3-c95b-0854da15fc20@vivier.eu>
Date: Wed, 15 Sep 2021 14:48:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210911082036.436139-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7wHMEuWWceFZvVP2IAs/p8Oebsfi83lKpuwAHen5xe0dUxbLZGO
 qHht4F0GDHHqbBKuHgBqRSJruxpqiqFcBnZsMlvUI5OBeYb96Fh2Evpouqrea4LO26qrLlm
 omaxIr8NbsAN9lBpEWMM0GQ6UgytCRdhNvOOtlJ8foceCe8Gd4jkSDTLyD8J0Rwl5JkI5vV
 wCckMa5aa7c+lbZ1+k0wg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ilDNiaOelJw=:Al0L9i4N1GPTA2JhY+tjXM
 TaeF0tzZanRuqekHsql9zXt+Y7+HT4/56y79ddh7Z07FbmO70uTs4Mm87VNo990ieI0wpeWeL
 Fv6Ucco3w0FjXG245JSY83GqmJGeJm6YlQOlkkLw2KlcKiTJfiW9dZgA6ApODQ9d810hJ2wLZ
 ESJWSKXkUzaJ4W9a6EGfKgAA4xWPPcjunobyUoTB0NCgHoBREUPha/C/uOH+2H2Gt8+mseAxM
 PvRkV1+xl4Fw1vW6a9cJqYkeLuYxCNC+SmV6+C9QiSL9gWEGlk0/TObtv1m0UmS7iNhkdsCzE
 PgTEfe9yGscYgJ22IxlMes+5CvHn168BDp2jEtkpTpC05OzBTa88/tDx4WlByThP5iwgFwA6E
 usLG4POe1HFFUWsjc5nFs4Wk3IidSODS6+XjnraHlQjjAefMdwh7hwEkuspwi27XswnSEgQES
 Z+UPLkdty9fb1m/h4cjfHAytp1uUv7PDjZ0pVq96vQntQlCqPucu+uLy0FZzz0jYTgWaEZAuN
 pJiDV0ziaJnQaX3OI73xlUo0LwhM8tyE1oWb+BQSrG36ktvFtRoRU4e+zw2ac5ZE99q1sj5qF
 3C/BTplRF1kh0p0qb9aFLheXcYCtoIcfOh6Kp3eBojli3eQJGubGxdfCRsz6T1QLOkognJXeU
 A/NUhE8dYJigVHRn1hmjhTpLxQDYKbqBFNbh5RfX4ZNYsTCFj49WsfBimYH0gs50+KpOJ3bih
 3O5OHuSMNlIagO2tPfTfNdzubvHgvQEEvPvx4Q==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.698,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Sep 2021 12:48:12 -0000

Le 11/09/2021 à 10:20, Philippe Mathieu-Daudé a écrit :
> Fix 'hotplugabble' -> 'hotpluggable' typo.
> 
> Reviewed-by: Ani Sinha <ani@anisinha.ca>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v1 still had a typo =) (Volker Rümelin)
> ---
>  hw/i386/acpi-build.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index d1f5fa3b5a5..dfaa47cdc20 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1916,7 +1916,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>      PCMachineState *pcms = PC_MACHINE(machine);
>      int nb_numa_nodes = machine->numa_state->num_nodes;
>      NodeInfo *numa_info = machine->numa_state->nodes;
> -    ram_addr_t hotplugabble_address_space_size =
> +    ram_addr_t hotpluggable_address_space_size =
>          object_property_get_int(OBJECT(pcms), PC_MACHINE_DEVMEM_REGION_SIZE,
>                                  NULL);
>  
> @@ -2022,10 +2022,10 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>       * Memory devices may override proximity set by this entry,
>       * providing _PXM method if necessary.
>       */
> -    if (hotplugabble_address_space_size) {
> +    if (hotpluggable_address_space_size) {
>          numamem = acpi_data_push(table_data, sizeof *numamem);
>          build_srat_memory(numamem, machine->device_memory->base,
> -                          hotplugabble_address_space_size, nb_numa_nodes - 1,
> +                          hotpluggable_address_space_size, nb_numa_nodes - 1,
>                            MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
>      }
>  
> 

Applied to my linux-user-for-6.2 branch.

Thanks,
Laurent

