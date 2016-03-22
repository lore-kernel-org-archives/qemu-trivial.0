Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aiLGm-0000Rb-Bb
	for mharc-qemu-trivial@gnu.org; Tue, 22 Mar 2016 08:18:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1aiLGi-0000MD-Hd
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 08:18:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1aiLGh-0005lW-7w
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 08:18:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56268)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1aiLGc-0005kL-AC; Tue, 22 Mar 2016 08:18:34 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id BB92C804EF;
	Tue, 22 Mar 2016 12:18:32 +0000 (UTC)
Received: from localhost (dhcp-14-151.nay.redhat.com [10.66.14.151])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2MCIJRm012920; Tue, 22 Mar 2016 08:18:21 -0400
Date: Tue, 22 Mar 2016 20:17:57 +0800
From: Fam Zheng <famz@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20160322121757.GA9749@ad.usersys.redhat.com>
References: <1458584486-21405-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1458584486-21405-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Janosch Frank <frankja@linux.vnet.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Fix typo in variable name (found and
	fixed by codespell)
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
X-List-Received-Date: Tue, 22 Mar 2016 12:18:41 -0000

On Mon, 03/21 19:21, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  scripts/dump-guest-memory.py | 64 ++++++++++++++++++++++----------------------
>  1 file changed, 32 insertions(+), 32 deletions(-)
> 
> diff --git a/scripts/dump-guest-memory.py b/scripts/dump-guest-memory.py
> index c0a2e99..eb24f78 100644
> --- a/scripts/dump-guest-memory.py
> +++ b/scripts/dump-guest-memory.py
> @@ -53,44 +53,44 @@ class ELF(object):
>          self.notes = []
>          self.segments = []
>          self.notes_size = 0
> -        self.endianess = None
> +        self.endianness = None
>          self.elfclass = ELFCLASS64
>  
>          if arch == 'aarch64-le':
> -            self.endianess = ELFDATA2LSB
> +            self.endianness = ELFDATA2LSB
>              self.elfclass = ELFCLASS64
> -            self.ehdr = get_arch_ehdr(self.endianess, self.elfclass)
> +            self.ehdr = get_arch_ehdr(self.endianness, self.elfclass)
>              self.ehdr.e_machine = EM_AARCH
>  
>          elif arch == 'aarch64-be':
> -            self.endianess = ELFDATA2MSB
> -            self.ehdr = get_arch_ehdr(self.endianess, self.elfclass)
> +            self.endianness = ELFDATA2MSB
> +            self.ehdr = get_arch_ehdr(self.endianness, self.elfclass)
>              self.ehdr.e_machine = EM_AARCH
>  
>          elif arch == 'X86_64':
> -            self.endianess = ELFDATA2LSB
> -            self.ehdr = get_arch_ehdr(self.endianess, self.elfclass)
> +            self.endianness = ELFDATA2LSB
> +            self.ehdr = get_arch_ehdr(self.endianness, self.elfclass)
>              self.ehdr.e_machine = EM_X86_64
>  
>          elif arch == '386':
> -            self.endianess = ELFDATA2LSB
> +            self.endianness = ELFDATA2LSB
>              self.elfclass = ELFCLASS32
> -            self.ehdr = get_arch_ehdr(self.endianess, self.elfclass)
> +            self.ehdr = get_arch_ehdr(self.endianness, self.elfclass)
>              self.ehdr.e_machine = EM_386
>  
>          elif arch == 's390':
> -            self.endianess = ELFDATA2MSB
> -            self.ehdr = get_arch_ehdr(self.endianess, self.elfclass)
> +            self.endianness = ELFDATA2MSB
> +            self.ehdr = get_arch_ehdr(self.endianness, self.elfclass)
>              self.ehdr.e_machine = EM_S390
>  
>          elif arch == 'ppc64-le':
> -            self.endianess = ELFDATA2LSB
> -            self.ehdr = get_arch_ehdr(self.endianess, self.elfclass)
> +            self.endianness = ELFDATA2LSB
> +            self.ehdr = get_arch_ehdr(self.endianness, self.elfclass)
>              self.ehdr.e_machine = EM_PPC64
>  
>          elif arch == 'ppc64-be':
> -            self.endianess = ELFDATA2MSB
> -            self.ehdr = get_arch_ehdr(self.endianess, self.elfclass)
> +            self.endianness = ELFDATA2MSB
> +            self.ehdr = get_arch_ehdr(self.endianness, self.elfclass)
>              self.ehdr.e_machine = EM_PPC64
>  
>          else:
> @@ -104,7 +104,7 @@ class ELF(object):
>      def add_note(self, n_name, n_desc, n_type):
>          """Adds a note to the ELF."""
>  
> -        note = get_arch_note(self.endianess, len(n_name), len(n_desc))
> +        note = get_arch_note(self.endianness, len(n_name), len(n_desc))
>          note.n_namesz = len(n_name) + 1
>          note.n_descsz = len(n_desc)
>          note.n_name = n_name.encode()
> @@ -123,7 +123,7 @@ class ELF(object):
>      def add_segment(self, p_type, p_paddr, p_size):
>          """Adds a segment to the elf."""
>  
> -        phdr = get_arch_phdr(self.endianess, self.elfclass)
> +        phdr = get_arch_phdr(self.endianness, self.elfclass)
>          phdr.p_type = p_type
>          phdr.p_paddr = p_paddr
>          phdr.p_filesz = p_size
> @@ -155,10 +155,10 @@ class ELF(object):
>              elf_file.write(note)
>  
>  
> -def get_arch_note(endianess, len_name, len_desc):
> -    """Returns a Note class with the specified endianess."""
> +def get_arch_note(endianness, len_name, len_desc):
> +    """Returns a Note class with the specified endianness."""
>  
> -    if endianess == ELFDATA2LSB:
> +    if endianness == ELFDATA2LSB:
>          superclass = ctypes.LittleEndianStructure
>      else:
>          superclass = ctypes.BigEndianStructure
> @@ -190,20 +190,20 @@ class Ident(ctypes.Structure):
>                  ('ei_abiversion', ctypes.c_ubyte),
>                  ('ei_pad', ctypes.c_ubyte * 7)]
>  
> -    def __init__(self, endianess, elfclass):
> +    def __init__(self, endianness, elfclass):
>          self.ei_mag0 = 0x7F
>          self.ei_mag1 = ord('E')
>          self.ei_mag2 = ord('L')
>          self.ei_mag3 = ord('F')
>          self.ei_class = elfclass
> -        self.ei_data = endianess
> +        self.ei_data = endianness
>          self.ei_version = EV_CURRENT
>  
>  
> -def get_arch_ehdr(endianess, elfclass):
> -    """Returns a EHDR64 class with the specified endianess."""
> +def get_arch_ehdr(endianness, elfclass):
> +    """Returns a EHDR64 class with the specified endianness."""
>  
> -    if endianess == ELFDATA2LSB:
> +    if endianness == ELFDATA2LSB:
>          superclass = ctypes.LittleEndianStructure
>      else:
>          superclass = ctypes.BigEndianStructure
> @@ -228,12 +228,12 @@ def get_arch_ehdr(endianess, elfclass):
>  
>          def __init__(self):
>              super(superclass, self).__init__()
> -            self.e_ident = Ident(endianess, elfclass)
> +            self.e_ident = Ident(endianness, elfclass)
>              self.e_type = ET_CORE
>              self.e_version = EV_CURRENT
>              self.e_ehsize = ctypes.sizeof(self)
>              self.e_phoff = ctypes.sizeof(self)
> -            self.e_phentsize = ctypes.sizeof(get_arch_phdr(endianess, elfclass))
> +            self.e_phentsize = ctypes.sizeof(get_arch_phdr(endianness, elfclass))
>              self.e_phnum = 0
>  
>  
> @@ -257,12 +257,12 @@ def get_arch_ehdr(endianess, elfclass):
>  
>          def __init__(self):
>              super(superclass, self).__init__()
> -            self.e_ident = Ident(endianess, elfclass)
> +            self.e_ident = Ident(endianness, elfclass)
>              self.e_type = ET_CORE
>              self.e_version = EV_CURRENT
>              self.e_ehsize = ctypes.sizeof(self)
>              self.e_phoff = ctypes.sizeof(self)
> -            self.e_phentsize = ctypes.sizeof(get_arch_phdr(endianess, elfclass))
> +            self.e_phentsize = ctypes.sizeof(get_arch_phdr(endianness, elfclass))
>              self.e_phnum = 0
>  
>      # End get_arch_ehdr
> @@ -272,10 +272,10 @@ def get_arch_ehdr(endianess, elfclass):
>          return EHDR32()
>  
>  
> -def get_arch_phdr(endianess, elfclass):
> -    """Returns a 32 or 64 bit PHDR class with the specified endianess."""
> +def get_arch_phdr(endianness, elfclass):
> +    """Returns a 32 or 64 bit PHDR class with the specified endianness."""
>  
> -    if endianess == ELFDATA2LSB:
> +    if endianness == ELFDATA2LSB:
>          superclass = ctypes.LittleEndianStructure
>      else:
>          superclass = ctypes.BigEndianStructure
> -- 
> 2.7.0
> 

Reviewed-by: Fam Zheng <famz@redhat.com>

(FWIW, there is one more "endianess" in doc/specs/rocker.txt :)

Fam

