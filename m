Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XSSUv-0007eU-HP
	for mharc-qemu-trivial@gnu.org; Fri, 12 Sep 2014 11:10:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1XSSUo-0007Sj-Tx
	for qemu-trivial@nongnu.org; Fri, 12 Sep 2014 11:10:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1XSSUk-0001v1-0Z
	for qemu-trivial@nongnu.org; Fri, 12 Sep 2014 11:10:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57481)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1XSSUS-0001rE-8W; Fri, 12 Sep 2014 11:10:24 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8CFAHtj025082
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 12 Sep 2014 11:10:18 -0400
Received: from localhost (ovpn-116-21.ams2.redhat.com [10.36.116.21])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8CFAE9Q019377; Fri, 12 Sep 2014 11:10:14 -0400
Date: Fri, 12 Sep 2014 11:10:13 -0400
From: Luiz Capitulino <lcapitulino@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Message-ID: <20140912111013.013ac142@redhat.com>
In-Reply-To: <1410347030-8996-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1410347030-8996-1-git-send-email-zhang.zhanghailiang@huawei.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, eblake@redhat.com, luonengjun@huawei.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com, lersek@redhat.com
Subject: Re: [Qemu-trivial] [PATCH V4] dump: let dump_error return error
	info to caller
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
X-List-Received-Date: Fri, 12 Sep 2014 15:10:52 -0000

On Wed, 10 Sep 2014 19:03:50 +0800
zhanghailiang <zhang.zhanghailiang@huawei.com> wrote:

> The second parameter of dump_error is unused, but one purpose of
> using this function is to report the error info.
> 
> Use error_set to return the error info to the caller.

This is a very good change, but it turns out it needs more work. Find
my comment below.

> 
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  V4:
> - Adjust the errp argument to the end 
> - Remove trailing '.' in error messages
>  V3:
> - Drop the '\n' in the message when call dump_error(comment of Eric Blake) 
>  V2:
> - Return the error reason to the caller which suggested by Luiz Capitulino.
> ---
>  dump.c | 165 ++++++++++++++++++++++++++++++++---------------------------------
>  1 file changed, 82 insertions(+), 83 deletions(-)
> 
> diff --git a/dump.c b/dump.c
> index 71d3e94..07d2300 100644
> --- a/dump.c
> +++ b/dump.c
> @@ -81,9 +81,10 @@ static int dump_cleanup(DumpState *s)
>      return 0;
>  }
>  
> -static void dump_error(DumpState *s, const char *reason)
> +static void dump_error(DumpState *s, const char *reason, Error **errp)
>  {
>      dump_cleanup(s);
> +    error_setg(errp, "%s", reason);
>  }
>  
>  static int fd_write_vmcore(const void *buf, size_t size, void *opaque)
> @@ -99,7 +100,7 @@ static int fd_write_vmcore(const void *buf, size_t size, void *opaque)
>      return 0;
>  }
>  
> -static int write_elf64_header(DumpState *s)
> +static int write_elf64_header(DumpState *s, Error **errp)
>  {
>      Elf64_Ehdr elf_header;
>      int ret;
> @@ -126,14 +127,14 @@ static int write_elf64_header(DumpState *s)
>  
>      ret = fd_write_vmcore(&elf_header, sizeof(elf_header), s);
>      if (ret < 0) {
> -        dump_error(s, "dump: failed to write elf header.\n");
> +        dump_error(s, "dump: failed to write elf header", errp);
>          return -1;
>      }
>  
>      return 0;
>  }
>  
> -static int write_elf32_header(DumpState *s)
> +static int write_elf32_header(DumpState *s, Error **errp)
>  {
>      Elf32_Ehdr elf_header;
>      int ret;
> @@ -160,7 +161,7 @@ static int write_elf32_header(DumpState *s)
>  
>      ret = fd_write_vmcore(&elf_header, sizeof(elf_header), s);
>      if (ret < 0) {
> -        dump_error(s, "dump: failed to write elf header.\n");
> +        dump_error(s, "dump: failed to write elf header", errp);
>          return -1;
>      }
>  
> @@ -169,7 +170,7 @@ static int write_elf32_header(DumpState *s)
>  
>  static int write_elf64_load(DumpState *s, MemoryMapping *memory_mapping,
>                              int phdr_index, hwaddr offset,
> -                            hwaddr filesz)
> +                            hwaddr filesz, Error **errp)
>  {
>      Elf64_Phdr phdr;
>      int ret;
> @@ -186,7 +187,7 @@ static int write_elf64_load(DumpState *s, MemoryMapping *memory_mapping,
>  
>      ret = fd_write_vmcore(&phdr, sizeof(Elf64_Phdr), s);
>      if (ret < 0) {
> -        dump_error(s, "dump: failed to write program header table.\n");
> +        dump_error(s, "dump: failed to write program header table", errp);
>          return -1;
>      }
>  
> @@ -195,7 +196,7 @@ static int write_elf64_load(DumpState *s, MemoryMapping *memory_mapping,
>  
>  static int write_elf32_load(DumpState *s, MemoryMapping *memory_mapping,
>                              int phdr_index, hwaddr offset,
> -                            hwaddr filesz)
> +                            hwaddr filesz, Error **errp)
>  {
>      Elf32_Phdr phdr;
>      int ret;
> @@ -212,14 +213,14 @@ static int write_elf32_load(DumpState *s, MemoryMapping *memory_mapping,
>  
>      ret = fd_write_vmcore(&phdr, sizeof(Elf32_Phdr), s);
>      if (ret < 0) {
> -        dump_error(s, "dump: failed to write program header table.\n");
> +        dump_error(s, "dump: failed to write program header table", errp);
>          return -1;
>      }
>  
>      return 0;
>  }
>  
> -static int write_elf64_note(DumpState *s)
> +static int write_elf64_note(DumpState *s, Error **errp)
>  {
>      Elf64_Phdr phdr;
>      hwaddr begin = s->memory_offset - s->note_size;
> @@ -235,7 +236,7 @@ static int write_elf64_note(DumpState *s)
>  
>      ret = fd_write_vmcore(&phdr, sizeof(Elf64_Phdr), s);
>      if (ret < 0) {
> -        dump_error(s, "dump: failed to write program header table.\n");
> +        dump_error(s, "dump: failed to write program header table", errp);
>          return -1;
>      }
>  
> @@ -247,7 +248,8 @@ static inline int cpu_index(CPUState *cpu)
>      return cpu->cpu_index + 1;
>  }
>  
> -static int write_elf64_notes(WriteCoreDumpFunction f, DumpState *s)
> +static int write_elf64_notes(WriteCoreDumpFunction f, DumpState *s,
> +                             Error **errp)
>  {
>      CPUState *cpu;
>      int ret;
> @@ -257,7 +259,7 @@ static int write_elf64_notes(WriteCoreDumpFunction f, DumpState *s)
>          id = cpu_index(cpu);
>          ret = cpu_write_elf64_note(f, cpu, id, s);
>          if (ret < 0) {
> -            dump_error(s, "dump: failed to write elf notes.\n");
> +            dump_error(s, "dump: failed to write elf notes", errp);
>              return -1;
>          }
>      }
> @@ -265,7 +267,7 @@ static int write_elf64_notes(WriteCoreDumpFunction f, DumpState *s)
>      CPU_FOREACH(cpu) {
>          ret = cpu_write_elf64_qemunote(f, cpu, s);
>          if (ret < 0) {
> -            dump_error(s, "dump: failed to write CPU status.\n");
> +            dump_error(s, "dump: failed to write CPU status", errp);
>              return -1;
>          }
>      }
> @@ -273,7 +275,7 @@ static int write_elf64_notes(WriteCoreDumpFunction f, DumpState *s)
>      return 0;
>  }
>  
> -static int write_elf32_note(DumpState *s)
> +static int write_elf32_note(DumpState *s, Error **errp)
>  {
>      hwaddr begin = s->memory_offset - s->note_size;
>      Elf32_Phdr phdr;
> @@ -289,14 +291,15 @@ static int write_elf32_note(DumpState *s)
>  
>      ret = fd_write_vmcore(&phdr, sizeof(Elf32_Phdr), s);
>      if (ret < 0) {
> -        dump_error(s, "dump: failed to write program header table.\n");
> +        dump_error(s, "dump: failed to write program header table", errp);
>          return -1;
>      }
>  
>      return 0;
>  }
>  
> -static int write_elf32_notes(WriteCoreDumpFunction f, DumpState *s)
> +static int write_elf32_notes(WriteCoreDumpFunction f, DumpState *s,
> +                             Error **errp)
>  {
>      CPUState *cpu;
>      int ret;
> @@ -306,7 +309,7 @@ static int write_elf32_notes(WriteCoreDumpFunction f, DumpState *s)
>          id = cpu_index(cpu);
>          ret = cpu_write_elf32_note(f, cpu, id, s);
>          if (ret < 0) {
> -            dump_error(s, "dump: failed to write elf notes.\n");
> +            dump_error(s, "dump: failed to write elf notes", errp);
>              return -1;
>          }
>      }
> @@ -314,7 +317,7 @@ static int write_elf32_notes(WriteCoreDumpFunction f, DumpState *s)
>      CPU_FOREACH(cpu) {
>          ret = cpu_write_elf32_qemunote(f, cpu, s);
>          if (ret < 0) {
> -            dump_error(s, "dump: failed to write CPU status.\n");
> +            dump_error(s, "dump: failed to write CPU status", errp);
>              return -1;
>          }
>      }
> @@ -322,7 +325,7 @@ static int write_elf32_notes(WriteCoreDumpFunction f, DumpState *s)
>      return 0;
>  }
>  
> -static int write_elf_section(DumpState *s, int type)
> +static int write_elf_section(DumpState *s, int type, Error **errp)
>  {
>      Elf32_Shdr shdr32;
>      Elf64_Shdr shdr64;
> @@ -344,20 +347,20 @@ static int write_elf_section(DumpState *s, int type)
>  
>      ret = fd_write_vmcore(&shdr, shdr_size, s);
>      if (ret < 0) {
> -        dump_error(s, "dump: failed to write section header table.\n");
> +        dump_error(s, "dump: failed to write section header table", errp);
>          return -1;
>      }
>  
>      return 0;
>  }
>  
> -static int write_data(DumpState *s, void *buf, int length)
> +static int write_data(DumpState *s, void *buf, int length, Error **errp)
>  {
>      int ret;
>  
>      ret = fd_write_vmcore(buf, length, s);
>      if (ret < 0) {
> -        dump_error(s, "dump: failed to save memory.\n");
> +        dump_error(s, "dump: failed to save memory", errp);
>          return -1;
>      }
>  
> @@ -366,14 +369,14 @@ static int write_data(DumpState *s, void *buf, int length)
>  
>  /* write the memroy to vmcore. 1 page per I/O. */
>  static int write_memory(DumpState *s, GuestPhysBlock *block, ram_addr_t start,
> -                        int64_t size)
> +                        int64_t size, Error **errp)
>  {
>      int64_t i;
>      int ret;
>  
>      for (i = 0; i < size / TARGET_PAGE_SIZE; i++) {
>          ret = write_data(s, block->host_addr + start + i * TARGET_PAGE_SIZE,
> -                         TARGET_PAGE_SIZE);
> +                         TARGET_PAGE_SIZE, errp);
>          if (ret < 0) {
>              return ret;
>          }
> @@ -381,7 +384,7 @@ static int write_memory(DumpState *s, GuestPhysBlock *block, ram_addr_t start,
>  
>      if ((size % TARGET_PAGE_SIZE) != 0) {
>          ret = write_data(s, block->host_addr + start + i * TARGET_PAGE_SIZE,
> -                         size % TARGET_PAGE_SIZE);
> +                         size % TARGET_PAGE_SIZE, errp);
>          if (ret < 0) {
>              return ret;
>          }
> @@ -452,7 +455,7 @@ static void get_offset_range(hwaddr phys_addr,
>      }
>  }
>  
> -static int write_elf_loads(DumpState *s)
> +static int write_elf_loads(DumpState *s, Error **errp)
>  {
>      hwaddr offset, filesz;
>      MemoryMapping *memory_mapping;
> @@ -472,10 +475,10 @@ static int write_elf_loads(DumpState *s)
>                           s, &offset, &filesz);
>          if (s->dump_info.d_class == ELFCLASS64) {
>              ret = write_elf64_load(s, memory_mapping, phdr_index++, offset,
> -                                   filesz);
> +                                   filesz, errp);
>          } else {
>              ret = write_elf32_load(s, memory_mapping, phdr_index++, offset,
> -                                   filesz);
> +                                   filesz, errp);
>          }
>  
>          if (ret < 0) {
> @@ -491,7 +494,7 @@ static int write_elf_loads(DumpState *s)
>  }
>  
>  /* write elf header, PT_NOTE and elf note to vmcore. */
> -static int dump_begin(DumpState *s)
> +static int dump_begin(DumpState *s, Error **errp)
>  {
>      int ret;
>  
> @@ -521,9 +524,9 @@ static int dump_begin(DumpState *s)
>  
>      /* write elf header to vmcore */
>      if (s->dump_info.d_class == ELFCLASS64) {
> -        ret = write_elf64_header(s);
> +        ret = write_elf64_header(s, errp);
>      } else {
> -        ret = write_elf32_header(s);
> +        ret = write_elf32_header(s, errp);
>      }
>      if (ret < 0) {
>          return -1;
> @@ -531,47 +534,47 @@ static int dump_begin(DumpState *s)
>  
>      if (s->dump_info.d_class == ELFCLASS64) {
>          /* write PT_NOTE to vmcore */
> -        if (write_elf64_note(s) < 0) {
> +        if (write_elf64_note(s, errp) < 0) {
>              return -1;
>          }

Usually, functions shouldn't return an error code _and_ an Error
object. So, for functions like write_elf64_note() you have to turn
them void.

Also, this means that it's time to break this into a series of patches.
Maybe you could convert one helper function or a group of them per patch.

>  
>          /* write all PT_LOAD to vmcore */
> -        if (write_elf_loads(s) < 0) {
> +        if (write_elf_loads(s, errp) < 0) {
>              return -1;
>          }
>  
>          /* write section to vmcore */
>          if (s->have_section) {
> -            if (write_elf_section(s, 1) < 0) {
> +            if (write_elf_section(s, 1, errp) < 0) {
>                  return -1;
>              }
>          }
>  
>          /* write notes to vmcore */
> -        if (write_elf64_notes(fd_write_vmcore, s) < 0) {
> +        if (write_elf64_notes(fd_write_vmcore, s, errp) < 0) {
>              return -1;
>          }
>  
>      } else {
>          /* write PT_NOTE to vmcore */
> -        if (write_elf32_note(s) < 0) {
> +        if (write_elf32_note(s, errp) < 0) {
>              return -1;
>          }
>  
>          /* write all PT_LOAD to vmcore */
> -        if (write_elf_loads(s) < 0) {
> +        if (write_elf_loads(s, errp) < 0) {
>              return -1;
>          }
>  
>          /* write section to vmcore */
>          if (s->have_section) {
> -            if (write_elf_section(s, 0) < 0) {
> +            if (write_elf_section(s, 0, errp) < 0) {
>                  return -1;
>              }
>          }
>  
>          /* write notes to vmcore */
> -        if (write_elf32_notes(fd_write_vmcore, s) < 0) {
> +        if (write_elf32_notes(fd_write_vmcore, s, errp) < 0) {
>              return -1;
>          }
>      }
> @@ -614,7 +617,7 @@ static int get_next_block(DumpState *s, GuestPhysBlock *block)
>  }
>  
>  /* write all memory to vmcore */
> -static int dump_iterate(DumpState *s)
> +static int dump_iterate(DumpState *s, Error **errp)
>  {
>      GuestPhysBlock *block;
>      int64_t size;
> @@ -630,7 +633,7 @@ static int dump_iterate(DumpState *s)
>                  size -= block->target_end - (s->begin + s->length);
>              }
>          }
> -        ret = write_memory(s, block, s->start, size);
> +        ret = write_memory(s, block, s->start, size, errp);
>          if (ret == -1) {
>              return ret;
>          }
> @@ -643,16 +646,16 @@ static int dump_iterate(DumpState *s)
>      }
>  }
>  
> -static int create_vmcore(DumpState *s)
> +static int create_vmcore(DumpState *s, Error **errp)
>  {
>      int ret;
>  
> -    ret = dump_begin(s);
> +    ret = dump_begin(s, errp);
>      if (ret < 0) {
>          return -1;
>      }
>  
> -    ret = dump_iterate(s);
> +    ret = dump_iterate(s, errp);
>      if (ret < 0) {
>          return -1;
>      }
> @@ -738,7 +741,7 @@ static int buf_write_note(const void *buf, size_t size, void *opaque)
>  }
>  
>  /* write common header, sub header and elf note to vmcore */
> -static int create_header32(DumpState *s)
> +static int create_header32(DumpState *s, Error **errp)
>  {
>      int ret = 0;
>      DiskDumpHeader32 *dh = NULL;
> @@ -784,7 +787,7 @@ static int create_header32(DumpState *s)
>      dh->status = cpu_to_dump32(s, status);
>  
>      if (write_buffer(s->fd, 0, dh, size) < 0) {
> -        dump_error(s, "dump: failed to write disk dump header.\n");
> +        dump_error(s, "dump: failed to write disk dump header", errp);
>          ret = -1;
>          goto out;
>      }
> @@ -804,7 +807,7 @@ static int create_header32(DumpState *s)
>  
>      if (write_buffer(s->fd, DISKDUMP_HEADER_BLOCKS *
>                       block_size, kh, size) < 0) {
> -        dump_error(s, "dump: failed to write kdump sub header.\n");
> +        dump_error(s, "dump: failed to write kdump sub header", errp);
>          ret = -1;
>          goto out;
>      }
> @@ -814,14 +817,14 @@ static int create_header32(DumpState *s)
>      s->note_buf_offset = 0;
>  
>      /* use s->note_buf to store notes temporarily */
> -    if (write_elf32_notes(buf_write_note, s) < 0) {
> +    if (write_elf32_notes(buf_write_note, s, errp) < 0) {
>          ret = -1;
>          goto out;
>      }
>  
>      if (write_buffer(s->fd, offset_note, s->note_buf,
>                       s->note_size) < 0) {
> -        dump_error(s, "dump: failed to write notes");
> +        dump_error(s, "dump: failed to write notes", errp);
>          ret = -1;
>          goto out;
>      }
> @@ -843,7 +846,7 @@ out:
>  }
>  
>  /* write common header, sub header and elf note to vmcore */
> -static int create_header64(DumpState *s)
> +static int create_header64(DumpState *s, Error **errp)
>  {
>      int ret = 0;
>      DiskDumpHeader64 *dh = NULL;
> @@ -889,7 +892,7 @@ static int create_header64(DumpState *s)
>      dh->status = cpu_to_dump32(s, status);
>  
>      if (write_buffer(s->fd, 0, dh, size) < 0) {
> -        dump_error(s, "dump: failed to write disk dump header.\n");
> +        dump_error(s, "dump: failed to write disk dump header", errp);
>          ret = -1;
>          goto out;
>      }
> @@ -909,7 +912,7 @@ static int create_header64(DumpState *s)
>  
>      if (write_buffer(s->fd, DISKDUMP_HEADER_BLOCKS *
>                       block_size, kh, size) < 0) {
> -        dump_error(s, "dump: failed to write kdump sub header.\n");
> +        dump_error(s, "dump: failed to write kdump sub header", errp);
>          ret = -1;
>          goto out;
>      }
> @@ -919,14 +922,14 @@ static int create_header64(DumpState *s)
>      s->note_buf_offset = 0;
>  
>      /* use s->note_buf to store notes temporarily */
> -    if (write_elf64_notes(buf_write_note, s) < 0) {
> +    if (write_elf64_notes(buf_write_note, s, errp) < 0) {
>          ret = -1;
>          goto out;
>      }
>  
>      if (write_buffer(s->fd, offset_note, s->note_buf,
>                       s->note_size) < 0) {
> -        dump_error(s, "dump: failed to write notes");
> +        dump_error(s, "dump: failed to write notes", errp);
>          ret = -1;
>          goto out;
>      }
> @@ -947,12 +950,12 @@ out:
>      return ret;
>  }
>  
> -static int write_dump_header(DumpState *s)
> +static int write_dump_header(DumpState *s, Error **errp)
>  {
>      if (s->dump_info.d_class == ELFCLASS32) {
> -        return create_header32(s);
> +        return create_header32(s, errp);
>      } else {
> -        return create_header64(s);
> +        return create_header64(s, errp);
>      }
>  }
>  
> @@ -1066,7 +1069,7 @@ static bool get_next_page(GuestPhysBlock **blockptr, uint64_t *pfnptr,
>      return true;
>  }
>  
> -static int write_dump_bitmap(DumpState *s)
> +static int write_dump_bitmap(DumpState *s, Error **errp)
>  {
>      int ret = 0;
>      uint64_t last_pfn, pfn;
> @@ -1087,7 +1090,7 @@ static int write_dump_bitmap(DumpState *s)
>      while (get_next_page(&block_iter, &pfn, NULL, s)) {
>          ret = set_dump_bitmap(last_pfn, pfn, true, dump_bitmap_buf, s);
>          if (ret < 0) {
> -            dump_error(s, "dump: failed to set dump_bitmap.\n");
> +            dump_error(s, "dump: failed to set dump_bitmap", errp);
>              ret = -1;
>              goto out;
>          }
> @@ -1105,7 +1108,7 @@ static int write_dump_bitmap(DumpState *s)
>          ret = set_dump_bitmap(last_pfn, last_pfn + PFN_BUFBITMAP, false,
>                                dump_bitmap_buf, s);
>          if (ret < 0) {
> -            dump_error(s, "dump: failed to sync dump_bitmap.\n");
> +            dump_error(s, "dump: failed to sync dump_bitmap", errp);
>              ret = -1;
>              goto out;
>          }
> @@ -1197,7 +1200,7 @@ static inline bool is_zero_page(const uint8_t *buf, size_t page_size)
>      return buffer_is_zero(buf, page_size);
>  }
>  
> -static int write_dump_pages(DumpState *s)
> +static int write_dump_pages(DumpState *s, Error **errp)
>  {
>      int ret = 0;
>      DataCache page_desc, page_data;
> @@ -1241,7 +1244,7 @@ static int write_dump_pages(DumpState *s)
>      ret = write_cache(&page_data, buf, TARGET_PAGE_SIZE, false);
>      g_free(buf);
>      if (ret < 0) {
> -        dump_error(s, "dump: failed to write page data(zero page).\n");
> +        dump_error(s, "dump: failed to write page data (zero page)", errp);
>          goto out;
>      }
>  
> @@ -1257,7 +1260,7 @@ static int write_dump_pages(DumpState *s)
>              ret = write_cache(&page_desc, &pd_zero, sizeof(PageDescriptor),
>                                false);
>              if (ret < 0) {
> -                dump_error(s, "dump: failed to write page desc.\n");
> +                dump_error(s, "dump: failed to write page desc", errp);
>                  goto out;
>              }
>          } else {
> @@ -1282,7 +1285,7 @@ static int write_dump_pages(DumpState *s)
>  
>                  ret = write_cache(&page_data, buf_out, size_out, false);
>                  if (ret < 0) {
> -                    dump_error(s, "dump: failed to write page data.\n");
> +                    dump_error(s, "dump: failed to write page data", errp);
>                      goto out;
>                  }
>  #ifdef CONFIG_LZO
> @@ -1295,7 +1298,7 @@ static int write_dump_pages(DumpState *s)
>  
>                  ret = write_cache(&page_data, buf_out, size_out, false);
>                  if (ret < 0) {
> -                    dump_error(s, "dump: failed to write page data.\n");
> +                    dump_error(s, "dump: failed to write page data", errp);
>                      goto out;
>                  }
>  #endif
> @@ -1309,7 +1312,7 @@ static int write_dump_pages(DumpState *s)
>  
>                  ret = write_cache(&page_data, buf_out, size_out, false);
>                  if (ret < 0) {
> -                    dump_error(s, "dump: failed to write page data.\n");
> +                    dump_error(s, "dump: failed to write page data", errp);
>                      goto out;
>                  }
>  #endif
> @@ -1324,7 +1327,7 @@ static int write_dump_pages(DumpState *s)
>  
>                  ret = write_cache(&page_data, buf, TARGET_PAGE_SIZE, false);
>                  if (ret < 0) {
> -                    dump_error(s, "dump: failed to write page data.\n");
> +                    dump_error(s, "dump: failed to write page data", errp);
>                      goto out;
>                  }
>              }
> @@ -1336,7 +1339,7 @@ static int write_dump_pages(DumpState *s)
>  
>              ret = write_cache(&page_desc, &pd, sizeof(PageDescriptor), false);
>              if (ret < 0) {
> -                dump_error(s, "dump: failed to write page desc.\n");
> +                dump_error(s, "dump: failed to write page desc", errp);
>                  goto out;
>              }
>          }
> @@ -1344,12 +1347,12 @@ static int write_dump_pages(DumpState *s)
>  
>      ret = write_cache(&page_desc, NULL, 0, true);
>      if (ret < 0) {
> -        dump_error(s, "dump: failed to sync cache for page_desc.\n");
> +        dump_error(s, "dump: failed to sync cache for page_desc", errp);
>          goto out;
>      }
>      ret = write_cache(&page_data, NULL, 0, true);
>      if (ret < 0) {
> -        dump_error(s, "dump: failed to sync cache for page_data.\n");
> +        dump_error(s, "dump: failed to sync cache for page_data", errp);
>          goto out;
>      }
>  
> @@ -1366,7 +1369,7 @@ out:
>      return ret;
>  }
>  
> -static int create_kdump_vmcore(DumpState *s)
> +static int create_kdump_vmcore(DumpState *s, Error **errp)
>  {
>      int ret;
>  
> @@ -1394,28 +1397,28 @@ static int create_kdump_vmcore(DumpState *s)
>  
>      ret = write_start_flat_header(s->fd);
>      if (ret < 0) {
> -        dump_error(s, "dump: failed to write start flat header.\n");
> +        dump_error(s, "dump: failed to write start flat header", errp);
>          return -1;
>      }
>  
> -    ret = write_dump_header(s);
> +    ret = write_dump_header(s, errp);
>      if (ret < 0) {
>          return -1;
>      }
>  
> -    ret = write_dump_bitmap(s);
> +    ret = write_dump_bitmap(s, errp);
>      if (ret < 0) {
>          return -1;
>      }
>  
> -    ret = write_dump_pages(s);
> +    ret = write_dump_pages(s, errp);
>      if (ret < 0) {
>          return -1;
>      }
>  
>      ret = write_end_flat_header(s->fd);
>      if (ret < 0) {
> -        dump_error(s, "dump: failed to write end flat header.\n");
> +        dump_error(s, "dump: failed to write end flat header", errp);
>          return -1;
>      }
>  
> @@ -1699,13 +1702,9 @@ void qmp_dump_guest_memory(bool paging, const char *file, bool has_begin,
>      }
>  
>      if (has_format && format != DUMP_GUEST_MEMORY_FORMAT_ELF) {
> -        if (create_kdump_vmcore(s) < 0) {
> -            error_set(errp, QERR_IO_ERROR);
> -        }
> +        create_kdump_vmcore(s, errp);
>      } else {
> -        if (create_vmcore(s) < 0) {
> -            error_set(errp, QERR_IO_ERROR);
> -        }
> +        create_vmcore(s, errp);
>      }
>  
>      g_free(s);


